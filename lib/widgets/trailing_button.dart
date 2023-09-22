import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';

import '../controller/favcontroller.dart';
import '../controller/playlist_controller.dart';
import 'snackbar.dart';

class Trailing extends StatelessWidget {
  const Trailing({
    super.key,
    required this.isfav,
    required this.song,
  });

  final bool isfav;
  final SongModel song;

  @override
  Widget build(BuildContext context) {
       final p = context.watch<PlaylistController>();
    final f = context.watch<FavouriteController>();
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Wrap(
        children: [
          isfav
              ? !f.isFavorite(song)
                  ? IconButton(
                      onPressed: () {
                        f.addfav(song);
                        SnackBarWidget(context).snackBar(
                            message:
                                '${song.displayNameWOExt} added to fav');
                        // p.songAddToPlaylist(songList[index], context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        f.removefav(song);
                        SnackBarWidget(context).snackBar(
                            message:
                                '${song.displayNameWOExt} removed from fav');
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                        ),
                      ),
                    )
              : !p.playlist!.isValueIn(song.id)
                  ? IconButton(
                      onPressed: () {
                        p.songAddToPlaylist(song.id);
                        SnackBarWidget(context).snackBar(
                          message:
                              '${song.displayNameWOExt} added to ${p.playlist!.name}',
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        p.songremoveFromPlaylist(song.id);
                         SnackBarWidget(context).snackBar(
                          message:
                              '${song.displayNameWOExt} removed from ${p.playlist!.name}',
                        );
                      },
                      icon: const Padding(
                        padding: EdgeInsets.only(bottom: 25),
                        child: Icon(
                          Icons.minimize,
                          color: Colors.white,
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}