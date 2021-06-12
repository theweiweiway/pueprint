import 'package:flutter/material.dart';
import '../pue_theme.dart';

class PueBody extends StatelessWidget {
  final Widget child;

  /// If you want to have the body in a `ListView`. This is particularily useful
  /// for pages with input that bring the keyboard up. The listview will make sure
  /// that everything on the page is visible even when the keyboard is in view so
  /// that there are no overflow errors.
  final bool listView;

  final bool fadeTop;
  final bool fadeBottom;
  final double? gutters;

  PueBody({
    required this.child,
    this.listView = false,
    this.fadeTop = false,
    this.fadeBottom = false,
    this.gutters,
  });

  Widget _buildBody(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: gutters ?? context.read<PueTheme>().gutters,
      ),
      child: (fadeTop || fadeBottom)
          ? ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    if (fadeTop) Colors.transparent,
                    for (var i = 0; i < 20; i++) Colors.black,
                    if (fadeBottom) Colors.transparent
                  ],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode.dstIn,
              child: child,
            )
          : child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return listView
        ? ListView(
            children: [_buildBody(context)],
          )
        : _buildBody(context);
  }
}
