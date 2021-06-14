import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar/export.dart';
import 'footer/export.dart';
import 'pue_theme.dart';

class PueProvider extends StatelessWidget {
  final Widget? child;
  final PueTheme? theme;
  final AppBarData? appBarData;
  final FooterData? footerData;
  final Widget Function(
    BuildContext context,
    AppBarData appBarData,
    FooterData footerData,
  )? builder;

  PueProvider({
    this.child,
    this.builder,
    this.theme,
    this.appBarData,
    this.footerData,
  }) : assert(!(child == null && builder == null));

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => theme ?? PueTheme(context: context),
      child: ChangeNotifierProvider(
        create: (_) => appBarData ?? AppBarData(),
        child: ChangeNotifierProvider(
          create: (_) => footerData ?? FooterData(),
          child: builder != null
              ? Builder(
                  builder: (context) {
                    final appBarData = context.watch<AppBarData>();
                    final footerData = context.watch<FooterData>();
                    return builder!(context, appBarData, footerData);
                  },
                )
              : child,
        ),
      ),
    );
  }
}
