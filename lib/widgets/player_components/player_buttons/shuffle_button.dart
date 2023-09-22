import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/player_controller.dart';

class ShuffleWidget extends StatelessWidget {
  const ShuffleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    bool isShuffle = false;
    return IconButton(
      onPressed: () {
        isShuffle == false
            ? playerController.audioPlayer.setShuffleModeEnabled(true)
            : playerController.audioPlayer.setShuffleModeEnabled(false);
      },
      icon: StreamBuilder<bool>(
        stream: playerController.audioPlayer.shuffleModeEnabledStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          isShuffle = snapshot.data;
          if (isShuffle) {
            return Icon(
              Icons.shuffle,
              color: Colors.red[600],
              size: 30,
            );
          } else {
            return const Icon(
              Icons.shuffle_rounded,
              color: Colors.white,
              size: 30,
            );
          }
        },
      ),
    );
  }
}
