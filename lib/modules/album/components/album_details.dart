import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:player/shared/models/album_model.dart';

class AlbumDetails extends StatelessWidget {
  final AlbumModel album;

  const AlbumDetails({
    super.key,
    required this.album,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 390,
      width: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 180,
            width: 180,
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
          ),
          const SizedBox(height: 25),
          Text(
            album.name,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            album.artist,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
