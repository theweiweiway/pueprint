import 'package:flutter/material.dart';

class PueFooter extends StatelessWidget {
  /// Padding that is applied to the whole footer.
  final EdgeInsetsGeometry padding;

  /// Top area of the footer. Good for putting things like progress bars
  final Widget top;

  /// Main footer area. Good for putting the main footer button
  final Widget child;

  /// Bottom area of the footer. Good for putting things like page indicator
  final Widget bottom;

  final bool floating;

  PueFooter({
    this.top = const SizedBox(),
    required this.child,
    this.bottom = const SizedBox(),
    this.padding = const EdgeInsets.all(0),
    this.floating = false,
  });

  @override
  Widget build(Object context) {
    return Padding(
      padding: padding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          top,
          child,
          bottom,
        ],
      ),
    );
  }
}
