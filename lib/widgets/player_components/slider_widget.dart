import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/player_controller.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = context.watch<PlayerController>();
    return Row(
      children: [
        Text(
          playerController.position.toString().substring(2, 7),
          style: const TextStyle(color: Colors.white),
        ),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color.fromARGB(255, 2, 94, 99),
                thumbShape:
                    const RoundSliderThumbShape(enabledThumbRadius: 8.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 2.0),
                trackHeight: 3),
            child: Slider(
              value: playerController.position.inSeconds.toDouble(),
              onChanged: (double value) {
                playerController.changeToSeconds(value.toInt());
                value = value;
              },
              min: 0.0,
              max: playerController.duration.inSeconds.toDouble(),
              inactiveColor: const Color.fromARGB(255, 73, 198, 236),
              activeColor: const Color.fromARGB(255, 4, 12, 124),
            ),
          ),
        ),
        Text(
          playerController.duration.toString().substring(2, 7),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
