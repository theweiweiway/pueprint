import 'package:flutter/material.dart';

/// A widget to easily set the background of the [PuePage] or [Pueprint]. Just
/// pass in one of the following:
/// - solid colour
/// - gradient
/// - network image
/// - asset image
///
/// and it will set the whole page background to it.
class PueBackground extends StatelessWidget {
  final NetworkImage? networkImage;
  final AssetImage? assetImage;
  final Gradient? gradient;

  /// Yes. Colour, not colour. Because that's how we do it in Canada
  final Color? colour;

  const PueBackground({
    this.networkImage,
    this.assetImage,
    this.gradient,
    this.colour,
  }) : assert(
          !(networkImage == null &&
              assetImage == null &&
              gradient == null &&
              colour == null),
        );

  BoxDecoration _buildBackground() {
    final _image = networkImage ?? assetImage;
    return BoxDecoration(
      gradient: gradient,
      color: colour,
      image: _image != null
          ? DecorationImage(
              image: _image as ImageProvider<Object>,
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: DecoratedBox(
        decoration: _buildBackground(),
      ),
    );
  }
}
