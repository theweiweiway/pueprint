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
  final Widget? child;

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
    AppBarData appBarData,
    FooterData footerData,
  )? builder;

  PueProvider({
    this.child,
    this.builder,
    this.theme,
    this.appBarData,
    this.footerData,
    this.pueprint = false,
  }) : assert(!(child == null && builder == null));

  @override
  Widget build(BuildContext context) {
    return pueprint
        ? ChangeNotifierProvider(
            create: (_) => theme ?? PueTheme(context: context),
            child: ChangeNotifierProvider(
              create: (_) => appBarData ?? AppBarData(),
              child: ChangeNotifierProvider(
                create: (_) => footerData ?? FooterData(),
                child: pueprint
                    ? (builder != null
                        ? Builder(
                            builder: (context) {
                              final appBarData = context.watch<AppBarData>();
                              final footerData = context.watch<FooterData>();
                              return builder!(context, appBarData, footerData);
                            },
                          )
                        : child)
                    : child,
              ),
            ),
          )
        : ChangeNotifierProvider(
            create: (_) => theme ?? PueTheme(context: context),
            child: child,
          );
  }
}
