import 'package:flutter/material.dart';
import '../../helpers/export.dart';
import 'pue_background.dart';

/// This widget can be used as a base for laying out your page. It is
/// similar to `PuePage`, but doesn't modify a parent `Pueprint`. It also
/// renders everything itself, without the help of a parent `Pueprint`.
///
/// The basic components of this component are:
/// - app bar
/// - header
/// - body
/// - footer
///
/// This does **not** use `Scaffold` under the hood
class SoloPuePage extends StatelessWidget {
  final PreferredSizeWidget? appBar;

  /// The header is sticky in the sense that if the body is a listview,
  /// the header will always stay in view
  final Widget? header;

  final Widget body;

  final Widget? footer;

  final Widget? background;

  /// Max width of this page. This is useful for desktop view, and does not
  /// affect the `appBar`
  final double maxWidth;

  SoloPuePage({
    this.appBar,
    this.header,
    required this.body,
    this.footer,
    this.background,
    this.maxWidth = PueConstants.defaultMaxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        background ??
            PueBackground(
              colour: Theme.of(context).scaffoldBackgroundColor,
            ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.start,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     if (appBar != null)
        //       // add empty space so that the body starts after the appbar
        //       SizedBox(height: appBar!.preferredSize.height),
        //     if (header != null) header!,
        //     Expanded(
        //       child: Padding(
        //         padding:
        //             bodyPadding ?? context.read<PueBaseTheme>().bodyPadding,
        //         child: body,
        //       ),
        //     ),
        //     if (footer != null && !floatFooter)
        //       // add empty space so that the body starts before the footer
        //       SizedBox(height: footer!.preferredSize.height),
        //   ],
        // ),
        // if (footer != null) Positioned(child: footer!, bottom: 0),
      ],
    );
  }
}
