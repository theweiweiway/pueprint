import 'package:flutter/material.dart';
import 'app_bar/pue_app_bar_data.dart';
import 'footer/export.dart';
import 'footer/pue_footer_data.dart';
import 'pue_provider.dart';
import 'pue_theme.dart';

/// This is the parent widget that descendant [PuePage]s will modify. It renders
/// the `appBar` and `footer`, so that on page changes, these elements will not
/// transition.
///
/// To add an `appBar` of `footer`, use the `appBarBuilder` and `footerBuilder` args.
/// For example:
/// ```dart
/// footerBuilder: (context, data) {
///   return PueFooter(
///     child: Container(
///       width: double.infinity,
///       child: ElevatedButton(
///         child: data.buttonChild,
///          onPressed: data.onTap,
///       ),
///     ),
///   );
/// }
/// ```
///
/// By using a builder, we are able to change the `child` and `onPressed` fields
/// declaratively, directly from our descendant [PuePage]s
///
/// To set the background of this [Pueprint], see the `theme` parameter and
/// corresponding `PueTheme` class.
///
/// It also allows you to pass in a `theme` so that all descendant [PuePage]s and
/// other [Pue] widgets can inherit this theme. For example, the `gutters` attribute
/// ensures that [PueHeader]s, [PueBody]s and [PueFooter]s all have the same amount
/// of horizontal padding so they line up nicely.
class Pueprint extends StatelessWidget {
  /// The main body for all children to be rendered in. Similar to a Scaffold `body`
  final Widget body;

  /// Defines the theme for all descendant [Pue] widgets, for example
  /// `gutters` (horizontalPadding) and the current `background`
  final PueTheme? theme;

  /// Use this to build the footer of all descendant pages. Example usage:
  ///
  /// ```dart
  /// footerBuilder: (context, data) {
  ///   return AppBar(
  ///     leading: IconButton(
  ///       onPressed: data.onTapLeading,
  ///       icon: Icon(data.icon),
  ///     ),
  ///   );
  /// }
  /// ```
  final PreferredSizeWidget Function(BuildContext context, AppBarData state)?
      appBarBuilder;

  /// Use this to build the footer of all descendant pages. Example usage:
  ///
  /// ```dart
  /// footerBuilder: (context, data) {
  ///   return PueFooter(
  ///     child: Container(
  ///       width: double.infinity,
  ///       child: ElevatedButton(
  ///         child: data.buttonChild,
  ///          onPressed: data.onTap,
  ///       ),
  ///     ),
  ///   );
  /// }
  /// ```
  final PueFooter Function(BuildContext context, FooterData state)?
      footerBuilder;

  Pueprint({
    required this.body,
    this.theme,
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
