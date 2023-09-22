import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/mostly_played_db.dart';
import 'package:musicia/view/home_screen.dart';

import '../widgets/song_tile.dart';

class MostlyPlayed extends StatelessWidget {
  const MostlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final most = context.watch<MostlyPlayedController>();
    most.getMostlyPlayedSongs();
    final List<SongModel?> songs = most.mostlyPlayed;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Mostly Played:${songs.length}'),
        ),
        body: songs.isEmpty
            ? const Center(
                child: Text('No Songs in\n Recentlyplayed',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  SongModel song = songs[index]!;
                  return SongTile(
                    song: song,
                    index: index,
                    playinglist: songs,
                  );
                },
                itemCount: songs.length,
              ),
        bottomNavigationBar: const MiniPlayerConsumer(),
      ),
    );
  }
}
