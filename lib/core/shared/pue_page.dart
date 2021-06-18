import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_bar/export.dart';
import '../footer/export.dart';

/// Use this widget in for each flow page that is a descendant of a [Pueprint].
///
/// This widget should only be used in flows, where a parent [Pueprint] widget controls
/// the rendering of the `appBar` and `footer`. For single page scenarios where you want
/// to layout your page with an `appBar`, `header`, `body` and `footer`, please see [SoloPuePage]
class PuePage extends StatefulWidget {
  /// Specifying this parameter will completely override the `appBar`
  /// which is being rendered in the parent [Pueprint] widget. If this is specified,
  /// the data in the `appBarData` parameter will be useless.
  final PreferredSizeWidget? appBar;

  /// This appears below the appBar and above the body. It is sticky, meaning that
  /// if the body is scrollable - no matter how far you scroll this header will
  /// still be visible. If you want the header to be scrollable, attach it in the body.
  /// For simple headers comprised of just main text and subtext, you can use [PueHeader]
  /// to eliminate boilerplate.
  final Widget? header;

  /// The main body of this page. If you would like extra features, use [PueBody]
  final Widget body;

  /// Specifying this parameter will completely override the `footer`
  /// which is being rendered in the parent [Pueprint] widget. If this is specified,
  /// the data in the `footerData` parameter will be useless.
  final PueFooter? footer;

  /// Override the current background on this specific page. You may use [PueBackground]
  /// or your own widget as the background.
  final Widget? background;

  /// Define the appBar's data. By doing so, the app bar (which is being rendered
  /// in the parent [Pueprint]) will receive this data, and now
  final AppBarData? appBarData;
  final FooterData? footerData;

  PuePage({
    this.appBar,
    this.footer,
    this.appBarData,
    this.header,
    required this.body,
    this.footerData,
    this.background,
  });

  @override
  _PuePageState createState() => _PuePageState();
}

class _PuePageState extends State<PuePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<FooterData>().setState(widget.footer != null
          ? FooterData(footerOverride: widget.footer)
          : (widget.footerData ?? FooterData()));
      context.read<AppBarData>().setState(widget.appBar != null
          ? AppBarData(appBarOverride: widget.appBar)
          : (widget.appBarData ?? AppBarData()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.background != null) widget.background!,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.header != null) widget.header!,
            Expanded(
              child: widget.body,
            ),
          ],
        ),
      ],
    );
  }
}
