import 'package:flutter/material.dart';

import 'pue_footer.dart';

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
  int? activeStep;

  /// Total number of steps in a page indicator
  int? stepCount;

  /// Percent of a progress indicator
  double? percent;

  FooterData({
    this.footerOverride,
    this.onTap,
    this.buttonChild,
    this.activeStep,
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

class EmptyFooter extends PueFooter {
  EmptyFooter() : super(child: Container());
}