import 'package:flutter/material.dart';

import 'player_buttons/loop_button.dart';
import 'player_buttons/play_pause_button.dart';
import 'player_buttons/shuffle_button.dart';
import 'player_buttons/skip_next.dart';
import 'player_buttons/skip_previous.dart';

class PlayerButtons extends StatelessWidget {
  const PlayerButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const LoopButton(),
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 19, 102, 170),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(70),
          ),
          width: 200,
          height: 63,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SkipPreviousWidget(),
              PlayPauseButtonWidget(),
              SkipNextWidget(),
            ],
          ),
        ),
        const ShuffleWidget(),
      ],
    );
  }
}