import 'dart:io'; // For file images
import 'dart:typed_data'; // For memory images

import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final ImageFrom imageFrom;
  final String? assetPath;
  final String? networkUrl;
  final File? file;
  final Uint8List? memoryImage;
  final double width;
  final double height;

  const CustomImage({
    super.key,
    required this.imageFrom,
    this.assetPath,
    this.networkUrl,
    this.file,
    this.memoryImage,
    this.width = 50,
    this.height = 50,
  }) : assert(
          (imageFrom == ImageFrom.ASSET && assetPath != null) ||
              (imageFrom == ImageFrom.NETWORK && networkUrl != null) ||
              (imageFrom == ImageFrom.FILE && file != null) ||
              (imageFrom == ImageFrom.MEMORY && memoryImage != null),
          'Correct parameters must be provided for the selected image source',
        );

  @override
  Widget build(BuildContext context) {
    switch (imageFrom) {
      case ImageFrom.ASSET:
        return Image.asset(
          assetPath!,
          height: height,
          width: width,
        ); // assetPath is required if ASSET
      case ImageFrom.NETWORK:
        return Image.network(
          networkUrl!,
          height: height,
          width: width,
        ); // networkUrl is required if NETWORK
      case ImageFrom.FILE:
        return Image.file(
          file!,
          height: height,
          width: width,
        ); // file is required if FILE
      case ImageFrom.MEMORY:
        return Image.memory(
          memoryImage!,
          height: height,
          width: width,
        ); // memoryImage is required if MEMORY
      default:
        return const SizedBox
            .shrink(); // Fallback to an empty widget if nothing is provided
    }
  }
}

enum ImageFrom { ASSET, NETWORK, FILE, MEMORY }
