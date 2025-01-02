import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen.dart';
import 'package:hello_world/screen/settings_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RootScreen();
  }
}

class _RootScreen extends State<RootScreen> with TickerProviderStateMixin {
  TabController? tabController;
  double threshold = 2.7;
  int number = 1;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(tabListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: TabBarView(
              controller: tabController, children: renderChildren())),
      bottomNavigationBar: renderBottomNavigationBar(),
    );
  }

  List<Widget> renderChildren() {
    return [
      HomeScreen(number: number),
      SettingsScreen(
          threshold: threshold,
          onValueChanged: (double value) {
            setState(() {
              threshold = value;
            });
          })
    ];
  }

  BottomNavigationBar renderBottomNavigationBar() {
    return BottomNavigationBar(
        currentIndex: tabController!.index,
        onTap: (int tabIndex) {
          setState(() {
            tabController?.animateTo(tabIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.edgesensor_high_outlined), label: "주사위"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "설정")
        ]);
  }

  void tabListener() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.removeListener(tabListener);
  }
}
