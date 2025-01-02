import 'package:flutter/material.dart';
import 'package:hello_world/const/colors.dart';

class SettingsScreen extends StatelessWidget {
  final double threshold;
  final ValueChanged<double> onValueChanged;

  const SettingsScreen(
      {Key? key, required this.threshold, required this.onValueChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: [
              Text(
                "민감도",
                style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Slider(
                value: threshold,
                onChanged: onValueChanged,
                min: 0.1,
                max: 10,
                divisions: 101,
                label: threshold.toStringAsFixed(1),
              )
            ],
          ),
        )
      ],
    );
  }
}
