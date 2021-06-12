import 'package:flutter/material.dart';
import 'app_bar/pue_app_bar_data.dart';
import 'footer/export.dart';
import 'footer/pue_footer_data.dart';
import 'pue_provider.dart';
import 'pue_theme.dart';

///
///
/// The `header` is not included as an parameter because the `bottom`
/// parameter of the `appBar` takes it's place. Instead, use the
/// `header` in the `PuePage` if you want to specify a header that transitions
/// from page to page just as the body does
class Pueprint extends StatelessWidget {
  final Widget body;

  final PueTheme? theme;

  /// Setting this to true will make this [Pueprint] inherit
  /// it's [PueTheme] from a parent [Pueprint] OR [PueProvider]
  final bool inherit;

  final PreferredSizeWidget Function(BuildContext context, AppBarData state)?
      appBarBuilder;
  final PueFooter Function(BuildContext context, FooterData state)?
      footerBuilder;

  Pueprint({
    required this.body,
    this.theme,
    this.inherit = false,
    this.appBarBuilder,
    this.footerBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return PueProvider(
      builder: (context, appBarState, footerState) {
        return Stack(
          children: [
            theme?.background ??
                PueTheme(context: context)
                    .background!, // this will default to Theme.of(context).scaffoldBackgroundColor
            Column(
              children: [
                /// If the `appBar` is defined, add extra space at the
                /// top of the body so that nothing will get hidden behind
                /// the `appBar`
                if (appBarBuilder != null)
                  appBarState.appBarOverride is EmptyAppBar
                      ? Container()
                      : (appBarState.appBarOverride != null
                          ? SizedBox(
                              height: appBarState
                                  .appBarOverride!.preferredSize.height)
                          : SizedBox(
                              height: appBarBuilder!(context, appBarState)
                                  .preferredSize
                                  .height)),

                Expanded(child: body),

                /// If the footer is not floating, render it directly in the `Column`
                if (footerBuilder != null &&
                    !footerBuilder!(context, footerState).floating)
                  footerState.footerOverride is EmptyFooter
                      ? Container()
                      : (footerBuilder!(context, footerState))
              ],
            ),
            if (appBarBuilder != null)
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: appBarState.appBarOverride is EmptyAppBar
                    ? Container()
                    : (appBarState.appBarOverride ??
                        appBarBuilder!(context, appBarState)),
              ),

            /// Only render the footer as a direct child of the [Stack] if
            /// the footer is `floating`
            if (footerBuilder != null &&
                footerBuilder!(context, footerState).floating)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: footerState.footerOverride is EmptyFooter
                    ? Container()
                    : (footerState.footerOverride ??
                        footerBuilder!(context, footerState)),
              ),
          ],
        );
      },
    );
  }
}
