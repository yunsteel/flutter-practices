import 'package:flutter/material.dart';
import 'package:hello_world/screen/home_screen/kanji_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class KanjiListRoute extends StatefulWidget {
  final String grade;

  const KanjiListRoute({super.key, required this.grade});

  @override
  State<StatefulWidget> createState() {
    return _KanjiListRoute();
  }
}

class _KanjiListRoute extends State<KanjiListRoute> {
  Future getKanjiList(String grade) {
    return Supabase.instance.client
        .from("상용한자")
        .select("*")
        .eq("학년", grade)
        .order("총획", ascending: true);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getKanjiList(widget.grade),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final kanjiList = snapshot.data!;
        return SafeArea(child: KanjiView(kanjiList: kanjiList));
      },
    );
  }
}
