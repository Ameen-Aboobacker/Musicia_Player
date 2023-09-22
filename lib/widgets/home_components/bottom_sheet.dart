import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/view/playlist_screen.dart';

import '../../controller/playlist_controller.dart';
import '../../model/muzic_model.dart';

class BottomSheetPlay extends StatelessWidget {
  const BottomSheetPlay({
    super.key,
    required this.song,
  });

  final SongModel song;

  @override
  Widget build(BuildContext context) {
    final playlistcontroller = context.watch<PlaylistController>();
    List<MuzicModel> lists = playlistcontroller.playlistDb.values.toList();
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 10,
            bottom: 10,
          ),
          child: Text(
            song.displayNameWOExt,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return index == 0
                  ? Row(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            newplaylist(
                                context: context, isHome: true, song: song.id);
                          },
                          icon: const Icon(Icons.playlist_add,
                              color: Colors.black),
                          label: const Text('create new playlist',
                              style: TextStyle(color: Colors.black)),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton.icon(
                          onPressed: lists[index - 1].isValueIn(song.id)
                              ? null
                              : () {
                                  final playlist = lists[index - 1];
                                  log(playlist.name);
                                  playlist.add(song.id);
                                  Navigator.pop(context);
                                  SnackBar snackBar = const SnackBar(
                                    content: Text('song added'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                          icon: lists[index - 1].isValueIn(song.id)
                              ? const Icon(Icons.featured_play_list_outlined)
                              : const Icon(Icons.featured_play_list_outlined,
                                  color: Colors.black),
                          label: lists[index - 1].isValueIn(song.id)
                              ? Text(
                                  '${lists[index - 1].name} - song already in this list',
                                )
                              : Text(lists[index - 1].name,
                                  style: const TextStyle(color: Colors.black)),
                        ),
                      ],
                    );
            },
            itemCount: lists.length + 1,
          ),
        ),
      ],
    );
  }
}
