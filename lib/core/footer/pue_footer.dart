import 'package:flutter/material.dart';
import '../../helpers/export.dart';

class PueFooter extends StatelessWidget {
  /// Padding that is applied to the whole footer.
  final EdgeInsetsGeometry padding;

  final double gutters;

  /// Top area of the footer. Good for putting things like progress bars
  final Widget? top;

  /// Main footer area. Good for putting the main footer button
  final Widget child;

  /// Bottom area of the footer. Good for putting things like page indicator
  final Widget? bottom;

  final bool floating;

  PueFooter({
    this.top,
    required this.child,
    this.bottom,
    this.padding = const EdgeInsets.all(0),
    this.floating = false,
    this.gutters = PueConstants.defaultGutters,
  });

  @override
  Widget build(Object context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: gutters),
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (top != null) top!,
            child,
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}
