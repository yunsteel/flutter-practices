import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KanjiView extends StatefulWidget {
  final List<dynamic> kanjiList;
  const KanjiView({super.key, required this.kanjiList});

  @override
  State<StatefulWidget> createState() {
    return _KanjiView();
  }
}

class _KanjiView extends State<KanjiView> {
  late final PageController pageController;

  late int index = 0;

  @override
  void initState() async {
    super.initState();
    // initState에서는 async 사용 못함. 나중에 찾아보기.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('last_read') != null) {
      index = prefs.getInt('last_read')!;
    }

    pageController = PageController(initialPage: index);
  }

  void changePageState() {
    setState(() {
      if (pageController.page != null) {
        index = pageController.page!.floor();
      }
    });
  }

  List<String> splitByNumberedList(String inputText) {
    RegExp regExp = RegExp(r'(?=\d+\.)');
    List<String> matches = inputText.split(regExp);

    return matches
        .map((match) => match.trim())
        .where((match) => match.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        left: 16,
        top: 40,
        child: IconButton(
            onPressed: () {
              pageController.previousPage(
                  duration: Duration(milliseconds: 100), curve: Curves.ease);
              changePageState();
            },
            icon: Icon(
              Icons.arrow_left,
              size: 40,
            )),
      ),
      PageView(
          controller: pageController,
          children: widget.kanjiList
              .map((kanji) => Column(
                    children: [
                      Text(
                        kanji["훈음"],
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        kanji["한자"],
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          kanji["발음"],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                            children: (splitByNumberedList(
                                    kanji["뜻"]?.toString() ?? ""))
                                .map((i) => Text(i))
                                .toList()),
                      )
                    ],
                  ))
              .toList()),
      Positioned(
        right: 16,
        top: 40,
        child: IconButton(
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
              changePageState();
            },
            icon: Icon(
              Icons.arrow_right,
              size: 40,
            )),
      ),
    ]);
  }
}
