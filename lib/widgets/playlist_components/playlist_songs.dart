import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/playlist_controller.dart';
import 'package:musicia/fun.dart';
import 'package:musicia/widgets/song_tile.dart';
import 'package:musicia/widgets/add_songs_list.dart';

import '../../view/home_screen.dart';

class PlaylistSongs extends StatelessWidget {
  const PlaylistSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final playlistController = context.watch<PlaylistController>();
    final playlist = playlistController.playlist;
    List<SongModel> songPlaylist = listPlaylist(playlist!.songId);
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            playlist.name,
            style: const TextStyle(
                fontFamily: 'UbuntuCondensed',
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 3, 15, 2),
            child: songPlaylist.isEmpty
                ? const Center(
                    child: Text(
                      'No Songs in\nthis playlist',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final song = songPlaylist[index];
                      return SongTile(
                        song:song,
                        index: index,
                        trailing: Wrap(
                          children: [
                            IconButton(
                              onPressed: () {
                                playlistController.songremoveFromPlaylist(song.id);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                       playinglist: songPlaylist,
                      );
                    },
                    itemCount: songPlaylist.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        height: 10.0,
                      );
                    },
                  ),
          ),
        ),
        floatingActionButton: AddSongButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const SongListPage();
                },
              ),
            );
          },
        ),
        bottomNavigationBar: const MiniPlayerConsumer(),
      ),
    );
  }

  List<SongModel> listPlaylist(List<int> songids) {
    List<SongModel> songs = [];
    for (int i = 0; i < songList.length; i++) {
      for (int j = 0; j < songids.length; j++) {
        if (songList[i]!.id == songids[j]) {
          songs.add(songList[i]!);
        }
      }
    }
    return songs;
  }
}

class AddSongButton extends StatelessWidget {
  const AddSongButton({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: const Text('Add Songs'),
      icon: const Icon(
        Icons.add_circle_outline,
        size: 35,
      ),
      backgroundColor: const Color.fromARGB(255, 3, 18, 83),
    );
  }
}
