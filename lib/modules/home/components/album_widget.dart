import 'package:flutter/material.dart';
import 'package:player/shared/models/album_model.dart';

class AlbumWidget extends StatelessWidget {
  final AlbumModel album;
  final int index;

  const AlbumWidget({
    super.key,
    required this.album,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      margin: EdgeInsets.only(
        top: 5,
        left: index.isEven ? 10 : 5,
        right: index.isEven ? 5 : 10,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          album.imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
