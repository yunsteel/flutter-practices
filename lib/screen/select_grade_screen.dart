import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen/routes/kanji_list_route.dart';

const grade_list = ['1', '2', '3', '4', '5', '6', 'S'];

class SelectGradeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: grade_list
            .map((grade) => GradeItem(onClickItem: () {}, grade: grade))
            .toList());
  }
}

class GradeItem extends StatelessWidget {
  final String grade;
  final Function onClickItem;

  const GradeItem({super.key, required this.onClickItem, required this.grade});

  @override
  Widget build(BuildContext context) {
    final buttonText = grade == 'S' ? "중등한자" : "$grade학년";

    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Scaffold(
                      appBar: AppBar(
                        title: Text(buttonText),
                      ),
                      body: KanjiListRoute(grade: grade))));
        },
        child: Text(buttonText));
  }
}
