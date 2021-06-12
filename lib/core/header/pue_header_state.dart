import 'package:flutter/material.dart';

class PueHeaderState extends ChangeNotifier {
  /// Main header text. If more fine-grained control of the title is needed,
  /// use the `title` variable
  String? text;

  /// Secondary header text. If more fine-grained control of the title is needed,
  /// use the `subtitle` variable
  String? subtext;

  Widget? title;
  Widget? subtitle;

  PueHeaderState({this.text, this.subtext, this.title, this.subtitle});

  void setState(PueHeaderState state) {
    title = state.title ?? title;
    subtitle = state.subtitle ?? subtitle;
    notifyListeners();
  }
}
