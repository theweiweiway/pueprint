import 'package:flutter/material.dart';

/// This is a data class for the `appBar` that is defined in the [Pueprint] widget.
/// To use, descendant [PuePage] widgets of the [Pueprint] parent define the `appBarData`
/// that should be shown on the page. Then, the [PuePage] calls the `setState` method
/// in this class which changes the state. Finally the parent [Pueprint] is notified of this state
/// and gets rebuilt with the new data via the `appBarBuilder` parameter.
class AppBarData extends ChangeNotifier {
  /// Specifying this parameter will override the whole `appBar`
  /// widget that is located in the [Pueprint].
  ///
  /// It completely replaces the [Pueprint] appBar, and does NOT render
  /// an appBar above it
  ///
  /// If this is specified, all other [AppBarData] parameters will be ignored
  PreferredSizeWidget? appBarOverride;

  /// The following widgets change the parameters of the appBar
  /// that is located in the [Pueprint]

  /// This is the leading `onTap` parameter in the appBar that is defined
  /// in the [Pueprint]
  Function()? onTapLeading;

  /// Set the icon of the [Pueprint] appBar
  IconData? icon;

  /// Set the title of the [Pueprint] appBar.
  Widget? title;

  /// Set the actions of the [Pueprint] appBar
  List<Widget>? actions;

  AppBarData({
    this.appBarOverride,
    this.onTapLeading,
    this.icon,
    this.title,
    this.actions,
  });

  /// Sets the `AppBarData` state so that the [Pueprint] can render and
  /// achieve the desired behaviour in the `appBar`
  void setState(AppBarData state) {
    appBarOverride = state.appBarOverride;
    onTapLeading = state.onTapLeading;
    icon = state.icon;
    title = state.title;
    actions = state.actions;
    notifyListeners();
  }
}

/// Pass this into the `appBar` parameter of [PuePage] to completely remove
/// the appBar for that specific page.
class EmptyAppBar extends AppBar {}
