import 'package:flutter/material.dart';
import 'package:player/shared/models/music_model.dart';

class MusicWidget extends StatelessWidget {
  final MusicModel music;
  final String albumImage;
  final String artist;

  const MusicWidget({
    super.key,
    required this.music,
    required this.albumImage,
    required this.artist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            margin: const EdgeInsets.only(
              right: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                albumImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                music.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                artist,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
