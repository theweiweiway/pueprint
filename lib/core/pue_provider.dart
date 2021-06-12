import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar/export.dart';
import 'footer/export.dart';
import 'pue_theme.dart';

class PueProvider extends StatelessWidget {
  final Widget? child;
  final PueTheme? theme;
  final AppBarData? appBarState;
  final FooterData? footerState;
  final Widget Function(
          BuildContext context, AppBarData appBarState, FooterData footerState)?
      builder;

  PueProvider({
    this.child,
    this.builder,
    this.theme,
    this.appBarState,
    this.footerState,
  }) : assert(!(child == null && builder == null));

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => theme ?? PueTheme(context: context),
      child: ChangeNotifierProvider(
        create: (_) => AppBarData(),
        child: ChangeNotifierProvider(
          create: (_) => FooterData(),
          child: builder != null
              ? Builder(
                  builder: (context) {
                    final appBarState = context.watch<AppBarData>();
                    final footerState = context.watch<FooterData>();
                    return builder!(context, appBarState, footerState);
                  },
                )
              : child,
        ),
      ),
    );
  }
}
