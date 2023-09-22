import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/player_controller.dart';
import '../home_components/bottom_sheet.dart';

class AddToPlaylist extends StatelessWidget {
  const AddToPlaylist({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final playerController = context.watch<PlayerController>();
    return IconButton(
      onPressed: () {
        final song = playerController.currentSong;
        showModalBottomSheet(
          backgroundColor: Colors.blueGrey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
          context: context,
          builder: (context) => BottomSheetPlay(song: song!),
        );
      },
      icon: const Icon(Icons.playlist_add),
      color: Colors.white,
      iconSize: 40,
    );
  }
}