import 'package:universal_platform/universal_platform.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is a basic `appBar` that eliminates any default [AppBar] styling, and has
/// a transparent background and shadow colour, black icon colour and 0 elevation.
///
/// Besides this, everything else is identical to the Flutter default [AppBar] component
///
///
class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Override the default `onTap` behaviour. If this is `null`, it will
  /// default to `Navigator.of(context).pop()`
  final void Function()? onTap;

  /// If true, the leading icon button will be in a disabled state. This is needed
  /// because the `onTap` parameter defaults to the default `onBack` behaviour specified
  /// in the [Pueprint] if `null`
  final bool disabled;

  /// If we want to override the back button icon, we can do so here
  final IconData? icon;

  /// If true, this widget uses `Icons.arrow_back_ios_new` on iOS or macOS, and
  /// `Icons.arrow_back` on everything else. Note that specifying `icon` will override this.
  final bool adaptiveBackButton;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Brightness? brightness;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final TextTheme? textTheme;
  final bool primary;
  final bool? centerTitle;
  final bool excludeHeaderSemantics;
  final double? titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;

  @override
  final Size preferredSize;

  final double? toolbarHeight;
  final double? leadingWidth;
  final bool? backwardsCompatibility;
  final TextStyle? toolbarTextStyle;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  BackAppBar({
    Key? key,
    this.onTap,
    this.disabled = false,
    this.icon,
    this.adaptiveBackButton = true,
    this.automaticallyImplyLeading = false,
    this.title,
    this.actions,
    this.flexibleSpace,
    this.bottom,
    this.elevation = 0,
    this.shadowColor = Colors.transparent,
    this.shape,
    this.backgroundColor = Colors.transparent,
    this.foregroundColor = Colors.transparent,
    this.brightness,
    this.iconTheme = const IconThemeData(color: Colors.black),
    this.actionsIconTheme = const IconThemeData(color: Colors.black),
    this.textTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.toolbarOpacity = 1.0,
    this.bottomOpacity = 1.0,
    this.toolbarHeight,
    this.leadingWidth,
    this.backwardsCompatibility,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  })  : assert(elevation == null || elevation >= 0.0),
        preferredSize = Size.fromHeight(toolbarHeight ??
            kToolbarHeight + (bottom?.preferredSize.height ?? 0.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: icon != null
            ? Icon(icon)
            : (adaptiveBackButton
                ? (UniversalPlatform.isIOS || UniversalPlatform.isMacOS)
                    ? Icon(Icons.arrow_back_ios_new)
                    : Icon(Icons.arrow_back)
                : Icon(Icons.arrow_back)),
        onPressed:
            disabled ? null : (onTap ?? () => Navigator.of(context).pop()),
      ),
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      elevation: elevation,
      shadowColor: shadowColor,
      shape: shape,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      brightness: brightness,
      iconTheme: iconTheme,
      actionsIconTheme: actionsIconTheme,
      textTheme: textTheme,
      primary: primary,
      centerTitle: centerTitle,
      excludeHeaderSemantics: excludeHeaderSemantics,
      titleSpacing: titleSpacing,
      toolbarOpacity: toolbarOpacity,
      bottomOpacity: bottomOpacity,
      toolbarHeight: toolbarHeight,
      leadingWidth: leadingWidth,
      backwardsCompatibility: backwardsCompatibility,
      toolbarTextStyle: toolbarTextStyle,
      titleTextStyle: titleTextStyle,
      systemOverlayStyle: systemOverlayStyle,
    );
  }
}
