import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/player_controller.dart';

class SongDetails extends StatelessWidget {
  const SongDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    return Column(
      children: [
         Text(
          playerController.currentSong!.displayNameWOExt == "<unknown>"
              ? "Unknown artist"
              : playerController.currentSong!.displayNameWOExt,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 23, color: Colors.white),
        ),
        Text(
          playerController.currentSong!.artist == "<unknown>"
              ? "Unknown artist"
              : playerController.currentSong!.artist!,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}
/*  */ 
