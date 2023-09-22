import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/player_controller.dart';




class PlayPauseButtonWidget extends StatelessWidget {
  const PlayPauseButtonWidget({
    super.key, this.isMini=false,
  });
  final bool isMini;
  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    return IconButton(
      color: Colors.white,
      onPressed: () async {
        if (playerController.audioPlayer.playing) {
          await playerController.audioPlayer.pause();
        } else {
          await playerController.audioPlayer.play();
        }
      },
      padding: const EdgeInsets.only(
        bottom: 10,
      ),
      iconSize: 60,
      icon: StreamBuilder<bool>(
        stream: playerController.audioPlayer.playingStream,
        builder: (context, snapshot) {
          bool? playingStage = snapshot.data;
          if (playingStage != null && playingStage) {
            return isMini
            ?const Icon(
              Icons.pause
            )
            :const Icon(
              Icons.pause_circle_outline,
            );
          } else {
            return isMini
            ?const Icon(
              Icons.play_arrow,
            )
            :const Icon(
              Icons.play_circle_outline,
            );
          }
        },
      ),
    );
  }
}
