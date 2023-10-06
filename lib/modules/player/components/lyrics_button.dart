import 'package:flutter/material.dart';

class LyricsButton extends StatelessWidget {
  const LyricsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 150,
          padding: const EdgeInsets.only(
            left: 35,
            right: 35,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.transparent,
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.mic,
                color: Colors.white,
              ),
              Text(
                'Lyrics',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
