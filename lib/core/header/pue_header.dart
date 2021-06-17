import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helpers/export.dart';
import '../pue_theme.dart';

/// Default simple header that renders a header and subheader
/// string. Also allows you to completely shove your own title widget in, as
/// well as a subtitle widget that exists under the title widget.
class PueHeader extends StatelessWidget {
  /// Horizontal padding for the header. Defaults to the closest [PueTheme]s gutters
  final double? gutters;

  /// The main title text in the header. Text style is taken from the closet [PueTheme] above
  /// this widget in the `headerTextStyle` parameter. If you need more control, use the `title`
  /// argument to completely override the text
  final String? text;

  /// The subtitle text in the header below the main text. Text style is taken
  /// from the closet [PueTheme] above this widget in the `headerSubtextStyle` parameter.
  /// If you need more control, use the `subtitle` argument to completely override the subtext
  final String? subtext;

  /// Overrides the text argument for more flexibility. Takes in a widget so you can pue to your heart's desire.
  final Widget? title;

  /// Overrides the subtext argument for more flexibility. Takes in a widget so you can pue to your heart's desire.
  final Widget? subtitle;

  /// If true, this will center all text as well as the `title` and `subtitle` widgets horizontally
  final bool centerTitle;

  /// Spacing between the title and subtitle
  final double textSpacing;

  /// Padding applied in addition to the gutters.
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
