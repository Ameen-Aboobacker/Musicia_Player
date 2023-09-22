import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/favcontroller.dart';
import '../../controller/player_controller.dart';

class AddToFav extends StatelessWidget {
  const AddToFav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final playerController = context.watch<PlayerController>();
    final favController = context.watch<FavouriteController>();
    return IconButton(
      onPressed: favController.isFavorite(playerController.currentSong)
          ? () {
              final song = playerController.currentSong;
              favController.removefav(song!);
            }
          : () {
              final song = playerController.currentSong;

              favController.addfav(song!);
            },
      icon: favController.isFavorite(playerController.currentSong)
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 35,
            )
          : const Icon(
              Icons.favorite_outline,
              color: Colors.white,
              size: 35,
            ),
    );
  }
}
