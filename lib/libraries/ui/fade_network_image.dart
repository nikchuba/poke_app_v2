import 'package:flutter/material.dart';
import 'package:rick_and_morty/libraries/ui/variables.dart';

class FadeNetworkImage extends StatelessWidget {
  const FadeNetworkImage({super.key, required this.image, this.errorImageSize});

  final String image;
  final num? errorImageSize;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.memoryNetwork(
      placeholder: kTransparentImage,
      image: image,
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
      imageErrorBuilder: (context, error, stackTrace) => Center(
        child: Icon(
          Icons.image_not_supported,
          size: errorImageSize?.toDouble(),
        ),
      ),
      placeholderErrorBuilder: (context, error, stackTrace) => Center(
        child: SizedBox.square(
          dimension: errorImageSize?.toDouble() ?? 24,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
