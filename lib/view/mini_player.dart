import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:provider/provider.dart';
import 'package:musicia/widgets/player_components/player_buttons/play_pause_button.dart';

import '../controller/player_controller.dart';
import '../widgets/player_components/player_buttons/skip_next.dart';
import '../widgets/player_components/player_buttons/skip_previous.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size;
    final PlayerController playerController = context.watch<PlayerController>();
    playerController.changeIndex();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 19, 102, 170),
          border: Border.all(
            width: 1,
          ),
        ),
        width: screenWidth.width,
        height: 63,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.music_note,
                color: Colors.white,
                size: 30,
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Marquee(
                      animationDuration:const  Duration(seconds: 5),
                      backDuration: const Duration(seconds: 5),
                      pauseDuration: Duration.zero,
                      child: Text(
                    playerController.currentSong != null
                        ? playerController.currentSong!.displayNameWOExt
                        : 'song',
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ), 
                    ), 
                  ),
                  Text(
                    playerController.currentSong != null
                        ? playerController.currentSong!.displayNameWOExt
                        : 'song',
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SkipPreviousWidget(),
                PlayPauseButtonWidget(isMini: true),
                SkipNextWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
