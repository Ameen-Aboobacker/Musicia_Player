import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

import '../../../controller/player_controller.dart';

class LoopButton extends StatelessWidget {
  const LoopButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final playerController = context.watch<PlayerController>();
    return IconButton(
      onPressed: () {
        playerController.audioPlayer.loopMode == LoopMode.one
            ? playerController.audioPlayer.setLoopMode(LoopMode.all)
            : playerController.audioPlayer.setLoopMode(LoopMode.one);
      },
      icon: StreamBuilder<LoopMode>(
        stream: playerController.audioPlayer.loopModeStream,
        builder: (context, snapshot) {
          final loopMode = snapshot.data;
          if (LoopMode.one == loopMode) {
            return Icon(
              Icons.repeat,
              color: Colors.red[600],
              size: 30,
            );
          } else {
            return const Icon(
              Icons.repeat,
              color: Colors.white,
              size: 30,
            );
          }
        },
      ),
    );
  }
}
