import 'package:flutter/material.dart';
import '../pue_theme.dart';

/// This widget is intended to be used in the `body` parameter of the
/// [PuePaqe] or [SoloPuePage] widgets. It provides some extra functionality as
/// opposed to just putting your own widget in the `body` section of the [PuePage]
/// (which is completely possible if you prefer). You can easily turn the body
/// into a listview, and fade the top and bottom of the body out. It also has `gutters`
/// so that the header, body and footer can all have the same horizontal padding.
class PueBody extends StatelessWidget {
  final Widget child;

  /// If you want to have the body in a `ListView`. This is particularily useful
  /// for pages with input that bring the keyboard up. The listview will make sure
  /// that everything on the page is visible even when the keyboard is in view so
  /// that there are no overflow errors.
  final bool listView;

  /// If this is true, the top of the `body` will fade in and out. This is useful
  /// if you have a listview and you dont want to abrupty chop off the top of the
  /// listview when scrolling
  final bool fadeTop;

  /// If this is true, the bottom of the `body` will fade in and out. This is useful
  /// if you have a listview and you dont want to abrupty chop off the bottom of the
  /// listview when scrolling
  final bool fadeBottom;

  /// The gutters (or horizontal padding) that exists on the left and right side
  /// of the footer. By default, it will use the `gutters` that are defined in the
  /// parent [Pueprint] widget or [PueProvider]
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
