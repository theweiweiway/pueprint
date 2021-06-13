import 'package:flutter/material.dart';
import '../pue_theme.dart';
import 'package:provider/provider.dart';

/// This widget is intended to be used in the `footer` parameter of the [Pueprint],
/// [PuePaqe] or [SoloPuePage] widgets. It provides an area to plug in your footer,
/// as well as a top and bottom area for page indicators, progress bars, etc. It also
/// takes a `floating` argument that determines whether the footer should float over
/// the body or not.
class PueFooter extends StatelessWidget {
  /// Padding that is applied to the whole footer.
  final EdgeInsetsGeometry padding;

  /// The gutters (or horizontal padding) that exists on the left and right side
  /// of the footer. By default, it will use the `gutters` that are defined in the
  /// parent [Pueprint] widget
  final double? gutters;

  /// Top area above the footer. Good for putting things like progress bars
  final Widget? top;

  /// Main footer area. Good for putting the main footer button
  final Widget child;

  /// Bottom area below footer. Good for putting things like page indicator
  final Widget? bottom;

  /// This controls whether the footer will float over the body content.
  /// If true, the footer will be in the [Stack] and appear above the body. If
  /// false, the footer gets rendered in a [Column] widget and will never allow
  /// the body to appear behind it.
  final bool floating;

  PueFooter({
    this.top,
    required this.child,
    this.bottom,
    this.padding = const EdgeInsets.all(0),
    this.floating = false,
    this.gutters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: gutters ?? context.read<PueTheme>().gutters),
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
