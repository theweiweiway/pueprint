import 'package:flutter/material.dart';
import 'package:pueprint/core/footer/pue_footer.dart';
import 'package:pueprint/core/pue_provider.dart';
import '../pue_theme.dart';
import 'pue_background.dart';
import 'package:provider/provider.dart';

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
  /// the header will always stay in view. Use the [PueHeader] if you want
  /// for a few small quality of life improvements
  final Widget? header;

  /// Main body of the widget. Use the [PueBody] if you want
  /// for a few small quality of life improvements
  final Widget body;

  /// Footer of the page
  final PueFooter? footer;

  /// Background of the whole page. Use the [PueBackground] if you want
  /// for a few small quality of life improvements
  final Widget? background;

  /// Max width of this page. This is useful for desktop view, and does not
  /// affect the `appBar`
  final double? maxWidth;

  final double? gutters;

  SoloPuePage({
    this.appBar,
    this.header,
    required this.body,
    this.footer,
    this.background,
    this.maxWidth,
    this.gutters,
  });

  @override
  Widget build(BuildContext context) {
    return PueProvider(
      theme: context
          .read<PueTheme>()
          .copyWith(context: context, gutters: gutters, background: background),
      child: Stack(
        children: [
          background ??
              PueBackground(
                colour: Theme.of(context).scaffoldBackgroundColor,
              ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (appBar != null)
                SizedBox(height: appBar!.preferredSize.height),
              if (header != null) header!,
              Expanded(
                child: body,
              ),

              /// If the footer is not floating, render it directly in the `Column`
              if (footer != null && !footer!.floating) footer!
            ],
          ),
          if (footer != null && footer!.floating)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: footer!,
            ),
        ],
      ),
    );
  }
}
