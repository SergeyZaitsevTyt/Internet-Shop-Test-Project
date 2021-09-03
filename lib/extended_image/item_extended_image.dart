import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class ItemExtendedImage extends StatelessWidget {
  final String url;

  ItemExtendedImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      url,
      cache: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return Icon(
              Icons.file_download,
            );
          case LoadState.completed:
            return null;
          case LoadState.failed:
            return Icon(
              Icons.image,
            );
        }
      },
    );
  }
}
