import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageDialog extends StatelessWidget {
  String imageUrl;

  ImageDialog(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    /*return Dialog(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: CachedNetworkImageProvider(
                imageUrl,
                errorListener: () {
                  print("Could not load image");
                },
              ),
              fit: BoxFit.cover),
        ),
      ),
    );*/
    return Dialog(
      //Single child scroll view added to allow users to scroll tall images
      child: SingleChildScrollView(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        ),
      ),
    );
  }
}
