import 'package:flutter/material.dart';
import '../helpers/export.dart';
import 'shared/pue_background.dart';

class PueTheme extends ChangeNotifier {
  /// Specifying this parameter will override the whole `appBar`
  /// widget that is located in the [Pueprint].
  ///
  /// It completely replaces the [Pueprint] appBar, and does NOT render
  /// an appBar above it

  BuildContext context;
  double gutters;
  double maxWidth;
  TextStyle? headerTextStyle;
  TextStyle? headerSubtextStyle;

  /// This controls the current background of the [Pueprint]
  Widget? background;

  PueTheme({
    required this.context,
    this.gutters = PueConstants.defaultGutters,
    this.maxWidth = PueConstants.defaultMaxWidth,
    this.headerTextStyle,
    this.headerSubtextStyle,
    this.background,
  }) {
    headerTextStyle = Theme.of(context).textTheme.headline6;
    headerSubtextStyle = Theme.of(context).textTheme.bodyText1;
    background =
        PueBackground(colour: Theme.of(context).scaffoldBackgroundColor);
  }

  void setState(PueTheme state) {
    gutters = state.gutters;
    maxWidth = state.maxWidth;
    headerTextStyle = state.headerTextStyle;
    headerSubtextStyle = state.headerSubtextStyle;
    notifyListeners();
  }
}
