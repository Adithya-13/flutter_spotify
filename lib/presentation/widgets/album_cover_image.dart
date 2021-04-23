import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumCoverImage extends StatelessWidget {

  final List<String> images;

  const AlbumCoverImage({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(child: CachedNetworkImage(imageUrl: images[0], fit: BoxFit.cover,)),
                Flexible(child: CachedNetworkImage(imageUrl: images[1], fit: BoxFit.cover,)),
              ],
            ),
            Row(
              children: [
                Flexible(child: CachedNetworkImage(imageUrl: images[2], fit: BoxFit.cover,)),
                Flexible(child: CachedNetworkImage(imageUrl: images[3], fit: BoxFit.cover,)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
