import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/helpers_core.dart';
import '../pue_theme.dart';

/// Default simple header that renders a header and subheader
/// string.
class PueHeader extends StatelessWidget {
  final double? gutters;
  final String? text;
  final String? subtext;

  final Widget? title;
  final Widget? subtitle;

  final bool centerTitle;

  /// Spacing between the title and subtitle
  final double textSpacing;

  final EdgeInsetsGeometry padding;

  PueHeader({
    this.gutters,
    this.text,
    this.subtext,
    this.title,
    this.subtitle,
    this.textSpacing = PueConstants.defaultTextSpacing,
    this.padding = const EdgeInsets.all(0),
    this.centerTitle = false,
  }) : assert((text != null && title != null));

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: gutters ?? context.read<PueTheme>().gutters,
      ),
      width: double.infinity,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: centerTitle
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: [
            if (title != null)
              title!
            else if (text != null)
              Text(
                text!,
                style: context.read<PueTheme>().headerTextStyle ??
                    Theme.of(context).textTheme.headline5,
              ),
            SizedBox(height: textSpacing),
            if (subtitle != null)
              subtitle!
            else if (subtext != null)
              Text(
                subtext!,
                style: context.read<PueTheme>().headerSubtextStyle ??
                    Theme.of(context).textTheme.headline5,
              ),
          ],
        ),
      ),
    );
  }
}
