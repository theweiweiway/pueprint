import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pueprint/core/app_bar/app_bar_export.dart';
import 'package:pueprint/core/footer/footer_export.dart';
import 'package:pueprint/core/header/pue_header_state.dart';

import 'pue_background.dart';

class PuePage extends StatefulWidget {
  final Widget? header;
  final Widget body;
  final PueBackground? background;

  final PueAppBarState? appBarState;
  final PueHeaderState? headerState;
  final PueFooterState? footerState;

  PuePage({
    this.appBarState,
    this.header,
    this.headerState,
    required this.body,
    this.footerState,
    this.background,
  });

  @override
  _PuePageState createState() => _PuePageState();
}

class _PuePageState extends State<PuePage> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context
          .read<PueFooterState>()
          .setState(widget.footerState ?? PueFooterState());
      context
          .read<PueAppBarState>()
          .setState(widget.appBarState ?? PueAppBarState());
      context
          .read<PueHeaderState>()
          .setState(widget.headerState ?? PueHeaderState());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (widget.background != null) widget.background!,
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
        //         child: fadeBodyTop || fadeBodyBottom
        //             ? ShaderMask(
        //                 shaderCallback: (rect) {
        //                   return LinearGradient(
        //                     begin: Alignment.topCenter,
        //                     end: Alignment.bottomCenter,
        //                     colors: [
        //                       if (fadeBodyTop) Colors.transparent,
        //                       for (var i = 0; i < 20; i++) Colors.black,
        //                       if (fadeBodyBottom) Colors.transparent
        //                     ],
        //                   ).createShader(
        //                     Rect.fromLTRB(0, 0, rect.width, rect.height),
        //                   );
        //                 },
        //                 blendMode: BlendMode.dstIn,
        //                 child: body,
        //               )
        //             : body,
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
