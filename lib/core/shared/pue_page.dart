import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_bar/export.dart';
import '../footer/export.dart';

class PuePage extends StatefulWidget {
  /// Specifying this parameter will completely override the `appBar` defined in the [Pueprint]
  final PreferredSizeWidget? appBar;
  final Widget? header;
  final Widget body;

  /// Specifying this parameter will completely override the `footer` defined in the [Pueprint]
  final PueFooter? footer;

  /// This is the background of the header and body. This does not
  /// override the [Pueprint] background, so by setting this, the
  /// app bar's background will **not** change
  ///
  /// If you would like to change to background of the whole page,
  /// pass a `background` argument into `theme`
  final Widget? background;

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
