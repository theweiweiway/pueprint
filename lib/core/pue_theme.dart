import 'package:flutter/material.dart';
import '../helpers/export.dart';
import 'shared/pue_background.dart';

/// The [PueTheme] contains all of the information for descendant [Pue] widgets.
/// These fields will be used to help descendant [PueHeader]s, [PueBody]s and [PueFooter]s
/// have consistent gutters and styling
class PueTheme extends ChangeNotifier {
  BuildContext context;

  /// This is the horizontal padding of descendant [PueHeader]s, [PueBody]s and [PueFooter]s.
  /// This helps to ensure
  double gutters;

  /// TBD: This will cap the max width of the [PueHeader]s, [PueBody]s and [PueFooter]s
  /// for web and desktop view
  // double maxWidth;

  /// The text style for the main header text, as well as subtext. This is used
  /// in the [PueHeader]
  TextStyle? headerTextStyle;
  TextStyle? headerSubtextStyle;

  /// This controls the background of the [Pueprint] or [SoloPuePage] if using
  /// outside of a flow.
  Widget? background;

  PueTheme({
    required this.context,
    this.gutters = PueConstants.defaultGutters,
    // this.maxWidth = PueConstants.defaultMaxWidth,
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
    // maxWidth = state.maxWidth;
    headerTextStyle = state.headerTextStyle;
    headerSubtextStyle = state.headerSubtextStyle;
    background = state.background;
    notifyListeners();
  }

  PueTheme copyWith({
    required BuildContext context,
    double? gutters,
    TextStyle? headerTextStyle,
    TextStyle? headerSubtextStyle,
    Widget? background,
  }) {
    return PueTheme(
      context: context,
      gutters: gutters ?? this.gutters,
      headerTextStyle: headerTextStyle ?? this.headerTextStyle,
      headerSubtextStyle: headerSubtextStyle ?? this.headerSubtextStyle,
      background: background ?? this.background,
    );
  }
}
