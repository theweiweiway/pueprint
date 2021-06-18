import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_bar/export.dart';
import 'footer/export.dart';
import 'pue_theme.dart';

/// This class provides 1 or 3 pieces of state to descendants, depending on whether it
/// is in the [Pueprint] widget or not. If in the [Pueprint], it provides a [PueTheme],
/// [AppBarData] and [FooterData] to descendants. If not, then it only provides [PueTheme]
/// to descendants (like [SoloPuePage]) to use
class PueProvider extends StatelessWidget {
  /// The theme for descendants of this widget. See [PueTheme] for more details
  final PueTheme? theme;

  /// The current `appBar` data for the [Pueprint] to use
  final AppBarData? appBarData;

  /// The current `footer` data for the [Pueprint] to use
  final FooterData? footerData;

  /// If this is true, that means this widget is being used in a [Pueprint] widget
  /// and thus, we must also initialize a [ChangeNotifierProvider] for `appBarData` and
  /// `footerData`
  final bool pueprint;

  /// Return a builder for the [Pueprint] widget to use directly. Should only
  /// be used in a [Pueprint] widget since it provides `appBarData` and `footerData`
  final Widget Function(
    BuildContext context,
  )? builder;

  /// This builder should only be used in the [Pueprint] widget. It provides
  /// both `appBarData` and `footerData` state for descendant [PuePage]s to use
  final Widget Function(
    BuildContext context,
    AppBarData appBarData,
    FooterData footerData,
  )? pueBuilder;

  PueProvider({
    this.builder,
    this.pueBuilder,
    this.theme,
    this.appBarData,
    this.footerData,
    this.pueprint = false,
  });

  @override
  Widget build(BuildContext context) {
    return pueprint
        ? ChangeNotifierProvider(
            create: (_) => theme ?? PueTheme(context: context),
            child: ChangeNotifierProvider(
              create: (_) => appBarData ?? AppBarData(),
              child: ChangeNotifierProvider(
                create: (_) => footerData ?? FooterData(),
                child: Builder(
                  builder: (context) {
                    if (pueprint) {
                      final appBarData = context.watch<AppBarData>();
                      final footerData = context.watch<FooterData>();
                      return pueBuilder!(context, appBarData, footerData);
                    }
                    return builder!(context);
                  },
                ),
              ),
            ),
          )
        : ChangeNotifierProvider(
            create: (_) => theme ?? PueTheme(context: context),
            child: Builder(
              builder: (context) {
                return builder!(context);
              },
            ),
          );
  }
}
