import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/mostly_played_db.dart';
import 'package:musicia/controller/recent_db.dart';
import 'package:musicia/view/musicplayingscreen/player.dart';
import '../controller/player_controller.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.index,
    required this.song,
    this.isList = false,
    this.playinglist,
    this.trailing,
  });

  final SongModel song;

  final List<SongModel?>? playinglist;
  final int index;
  final Widget? trailing;
  final bool isList;
  @override
  Widget build(BuildContext context) {
    final recentprovider = context.watch<RecentlyPlayedController>();
    final mostlyPlayedprovider = context.watch<MostlyPlayedController>();
    final playerProvider = context.watch<PlayerController>();
    return ListTile(
        leading: const Icon(
          Icons.music_note,
          color: Colors.white,
        ),
        onTap: isList
            ? () {
                log('songlist');
              }
            : () {
                playerProvider.audioPlayer.setAudioSource(
                    playerProvider.createSongList(
                      playinglist!,
                    ),
                    initialIndex: index);
                    playerProvider.playSong();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Player();
                }));
               playerProvider.changeIndex();
                recentprovider.addRecentlyPlayed(song.id);

                //mostly played
                mostlyPlayedprovider.addmostlyPlayed(song.id);

                playerProvider.audioPlayer.play();
              },
        title: Text(
          song.displayNameWOExt,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          '${song.artist == "<unknown>" ? "Unknown Artist" : song.artist}',
          overflow: TextOverflow.ellipsis,
        ),
        trailing: trailing);
  }
}
