import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:player/shared/mocks/album_mock.dart';

import '../../player_scaffold.dart';
import '../components/album_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final albums = AlbumMock.albums;

  @override
  Widget build(BuildContext context) {
    return PlayerScaffold(
      backgroundColor: Colors.grey.shade200,
      customBody: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: const Center(
              child: Text(
                'Music Player',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: albums.length,
              itemBuilder: (context, index) {
                final album = albums[index];

                return InkWell(
                  onTap: () => Modular.to.pushNamed(
                    '/album/',
                    arguments: album,
                  ),
                  child: AlbumWidget(album: album, index: index),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
