import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime firstDay = DateTime(2018, 1, 1);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
        backgroundColor: Color(0xFF383b47),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _DDay(
              onHeartPressed: onHeartPressed,
              firstDay: firstDay,
            ),
            _WifeImage()
          ],
        )));
  }

  void onHeartPressed() {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoDatePicker(
            onDateTimeChanged: (DateTime date) {
              print(date);
            },
            mode: CupertinoDatePickerMode.date,
          );
        });

    // setState(() {
    //   firstDay = firstDay.subtract(Duration(days: 1));
    // });
  }
}

class _DDay extends StatelessWidget {
  final GestureTapCallback onHeartPressed;
  final DateTime firstDay;

  _DDay({required this.onHeartPressed, required this.firstDay});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final now = DateTime.now();

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "내 사랑",
          style: textTheme.headlineLarge,
        ),
        Text(
          "에레쉬키갈",
          style: textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        IconButton(
          iconSize: 60,
          onPressed: this.onHeartPressed,
          icon: Icon(Icons.favorite),
          color: Colors.red,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "D+${DateTime(now.year, now.month, now.day).difference(firstDay).inDays + 1}",
          style: textTheme.headlineMedium,
        )
      ],
    );
  }
}

class _WifeImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.network(
          "https://i.namu.wiki/i/mvpTz6w7HRU88xchyUqOusZlnetTy5cioVEtF8ZI5iaa1psNpIpZ14XEFkoVsIlYFZyBGq3Yes-aK_itb9zORA.webp",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 2,
        ),
      ),
    );
  }
}
