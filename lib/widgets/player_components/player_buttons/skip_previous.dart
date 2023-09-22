import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/player_controller.dart';

class SkipPreviousWidget extends StatelessWidget {
  const SkipPreviousWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    return IconButton(
      padding: const EdgeInsets.only(bottom: 0, left: 0),
      onPressed: () async {
        if (playerController.audioPlayer.hasPrevious) {
          // add to recent
          /*  GetRecentSong.addRecentlyPlayed(widget
                        .songModelList[currentIndex - 1]
                        .id);*/

          //add to mostly
          /*  GetMostlyPlayed.addmostlyPlayed(widget
                        .songModelList[currentIndex - 1]
                        .id);*/

          await playerController.audioPlayer.seekToPrevious();
          await playerController.audioPlayer.play();
        } else {
          await playerController.audioPlayer.play();
        }
      },
      iconSize: 40,
      icon: const Icon(
        Icons.skip_previous,
        color: Colors.white,
      ),
    );
  }
}
