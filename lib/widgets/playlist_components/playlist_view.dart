import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/playlist_controller.dart';
import 'package:musicia/model/muzic_model.dart';
import 'package:musicia/view/favourite_screen.dart';
import 'package:musicia/widgets/playlist_components/playlist_songs.dart';

import 'update_dialogue.dart';

class PlaylistView extends StatelessWidget {
  const PlaylistView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlistdb = context.watch<PlaylistController>();
    final List<MuzicModel> list = playlistdb.playlistDb.values.toList();
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          final playlist =
              index != 0 ? list[index - 1] : MuzicModel(name: '', songId: []);
          return index == 0
              ? PlaylistFolder(
                  playlist: playlist,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FavouriteScreen(),
                    ));
                  },
                  title: "favourites",
                  isfav: true,
                )
              : PlaylistFolder(
                  title: playlist.name,
                  onTap: () {
                    playlistdb.getSinglePlaylist(list[index - 1].pid!);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PlaylistSongs();
                        },
                      ),
                    );
                  },
                  playlist: playlist);
        });
  }
}

class PlaylistFolder extends StatelessWidget {
  const PlaylistFolder({
    super.key,
    required this.title,
    required this.playlist,
    required this.onTap,
    this.isfav = false,
  });
  final String title;
  final MuzicModel playlist;
  final Function() onTap;
  final bool isfav;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          const Expanded(
              flex: 2,
              child: Icon(
                Icons.folder_rounded,
                color: Color.fromARGB(234, 255, 217, 0),
                size: 145,
              )),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(
              left: 50,
              right: 20,
              top: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: 'UbuntuCondensed',
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                if (!isfav)
                  IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => UpdateDialogue(
                            musicList: playlist,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      )),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
