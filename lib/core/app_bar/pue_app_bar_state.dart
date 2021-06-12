import 'package:flutter/material.dart';

class PueAppBarState extends ChangeNotifier {
  /// Specifying this parameter will override the whole `appBar`
  /// widget that is located in the [Pueprint].
  ///
  /// It completely replaces the [Pueprint] appBar, and does NOT render
  /// an appBar above it
  Widget? appBar;

  /// The following widgets change the parameters of the appBar
  /// that is located in the [Pueprint]

  /// This is the leading `onTap` parameter in the appBar that is defined
  /// in the [Pueprint]
  Function(dynamic data)? onTapLeading;
  IconData? icon;
  Widget? title;
  List<Widget>? actions;

  PueAppBarState(
      {this.appBar, this.onTapLeading, this.icon, this.title, this.actions});

  void setState(PueAppBarState state) {
    onTapLeading = state.onTapLeading ?? null;
    notifyListeners();
  }
}
