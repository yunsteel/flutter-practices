import 'package:flutter/material.dart';
import 'package:hello_world/screen/select_grade_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController controller = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정")
        ],
        currentIndex: controller.index,
        onTap: controller.animateTo,
      ),
      body: SafeArea(
          child: TabBarView(
        controller: controller,
        children: [SelectGradeScreen(), Text("설정")],
      )),
    );
  }
}
