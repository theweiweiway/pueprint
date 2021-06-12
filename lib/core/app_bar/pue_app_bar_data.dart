import 'package:flutter/material.dart';

class AppBarData extends ChangeNotifier {
  /// Specifying this parameter will override the whole `appBar`
  /// widget that is located in the [Pueprint].
  ///
  /// It completely replaces the [Pueprint] appBar, and does NOT render
  /// an appBar above it
  PreferredSizeWidget? appBarOverride;

  /// The following widgets change the parameters of the appBar
  /// that is located in the [Pueprint]

  /// This is the leading `onTap` parameter in the appBar that is defined
  /// in the [Pueprint]
  Function()? onTapLeading;
  IconData? icon;
  Widget? title;
  List<Widget>? actions;

  AppBarData(
      {this.appBarOverride,
      this.onTapLeading,
      this.icon,
      this.title,
      this.actions});

  void setState(AppBarData state) {
    appBarOverride = state.appBarOverride;
    onTapLeading = state.onTapLeading;
    icon = state.icon;
    title = state.title;
    actions = state.actions;
    notifyListeners();
  }
}

class EmptyAppBar extends AppBar {}
