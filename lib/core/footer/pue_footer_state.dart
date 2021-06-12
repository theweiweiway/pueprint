import 'package:flutter/material.dart';

class PueFooterState extends ChangeNotifier {
  /// On tap of the main button in the footer
  Function(dynamic data)? onTap;

  /// This is the child of the main button in the footer
  Widget? buttonChild;

  /// The active step of a page indicator
  int? activeStep;

  /// Total number of steps in a page indicator
  int? stepCount;

  /// Percent of a progress indicator
  double? percent;

  PueFooterState({
    this.onTap,
    this.buttonChild,
    this.activeStep,
    this.stepCount,
    this.percent,
  });

  void setState(PueFooterState state) {
    onTap = state.onTap;
    buttonChild = state.buttonChild;
    activeStep = state.activeStep;
    stepCount = state.stepCount;
    percent = state.percent;
    notifyListeners();
  }
}
