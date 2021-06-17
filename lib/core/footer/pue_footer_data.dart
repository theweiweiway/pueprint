import 'package:flutter/material.dart';

import 'pue_footer.dart';

/// This is the data class that holds the current footer information in a flow.
/// It is provided via the `footerBuilder` parameter in the [Pueprint].
/// Use [PuePage]s to update the footer data by passing in [FooterData] to
/// the `footerData` argument
class FooterData extends ChangeNotifier {
  /// Specifying this parameter will override the whole `footer`
  /// widget that is located in the [Pueprint].
  ///
  /// It completely replaces the [Pueprint] footer, and does NOT render
  /// a footer above it
  Widget? footerOverride;

  /// On tap of the main button in the footer
  void Function()? onTap;

  /// This is the child of the main button in the footer
  Widget? buttonChild;

  /// The active step of a page indicator
  int activeStep;

  /// Total number of steps in a page indicator
  int? stepCount;

  /// Percent of a progress indicator
  double? percent;

  FooterData({
    this.footerOverride,
    this.onTap,
    this.buttonChild,
    this.activeStep = 1,
    this.stepCount,
    this.percent,
  });

  void setState(FooterData state) {
    footerOverride = state.footerOverride;
    onTap = state.onTap;
    buttonChild = state.buttonChild;
    activeStep = state.activeStep;
    stepCount = state.stepCount;
    percent = state.percent;
    notifyListeners();
  }
}

/// Pass this into the `footer` parameter of [PuePage] to completely remove
/// the footer for that specific page.
class EmptyFooter extends PueFooter {
  EmptyFooter() : super(child: Container());
}
