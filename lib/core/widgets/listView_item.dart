import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, progress) 
          =>  Icon(Icons.error)
          ,
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
