import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/favcontroller.dart';
import 'bottom_sheet.dart';

class MoreDialogue extends StatelessWidget {
  const MoreDialogue({
    super.key,
    //required this.index,
    required this.song,
  });

  //final int  index;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavouriteController>();
    return SimpleDialog(
      title: Text(
        song.displayNameWOExt.toUpperCase(),
        style: const TextStyle(color: Colors.white),
      ),
      contentPadding: const EdgeInsets.only(top: 7, bottom: 7),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      children: [
        const SizedBox(
          height: 7,
        ),
        SimpleDialogOption(
          onPressed: () {
            log('add play pressed');
            Navigator.of(context).pop();
            showModalBottomSheet(
              context: context,
              backgroundColor: Colors.blueGrey,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
              ),
              
              builder: (context) {
                return BottomSheetPlay(song: song);
              },
            );
          },
          child: const Row(
            children: [
              Icon(
                Icons.playlist_add,
                color: Colors.white,
              ),
              SizedBox(width: 4),
              Text(
                'Add to playlist',
                style: TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: fav.isFavorite(song)
              ? () {
                  log('r fav pressed');
                  log(fav.isFavorite(song).toString());
                  fav.removefav(song);
                }
              : () {
                  log('add fav pressed');
                  log(fav.isFavorite(song).toString());
                  fav.addfav(song);
                },
          child: Row(
            children: [
              Icon(
                fav.isFavorite(song) ? Icons.favorite : Icons.favorite_outline,
                color: Colors.white,
              ),
              // FavoriteButton(songFavorite: startSong[index]),
              Text(
                fav.isFavorite(song)
                    ? ' Remove from Favourites'
                    : ' Add to favourites ',
                style: const TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
