import 'package:flutter/material.dart';

/// Paints the background of the [PuePage] or [Pueprint]
/// Can either paint:
/// - solid colour
/// - gradient
/// - network image
/// - asset image
/// as the background
class PueBackground extends StatelessWidget {
  final NetworkImage? networkImage;
  final AssetImage? assetImage;
  final Gradient? gradient;
  final Color? colour;

  const PueBackground({
    this.networkImage,
    this.assetImage,
    this.gradient,
    this.colour,
  });

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
