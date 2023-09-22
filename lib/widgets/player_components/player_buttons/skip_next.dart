import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/player_controller.dart';

class SkipNextWidget extends StatelessWidget {
  const SkipNextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    return IconButton(
        onPressed: () async {
          if (playerController.audioPlayer.hasNext) {
            //add recent
            /*   GetRecentSong.addRecentlyPlayed(widget
                          .songModelList[currentIndex + 1]
                          .id);
                      // add mostly
                      GetMostlyPlayed.addmostlyPlayed(widget
                          .songModelList[currentIndex + 1]
                          .id);*/
            await playerController.audioPlayer.seekToNext();
            await playerController.audioPlayer.play();
          } else {
            await playerController.audioPlayer.play();
          }
        },
        padding: const EdgeInsets.only(
          bottom: 0,
        ),
        iconSize: 40,
        icon: const Icon(
          Icons.skip_next,
          color: Colors.white,
        ));
  }
}
