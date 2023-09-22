import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/recent_db.dart';
import 'package:musicia/widgets/song_tile.dart';

import 'home_screen.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recentprovider = context.watch<RecentlyPlayedController>();

    final songs = recentprovider.getRecentSong().reversed.toList();
    int l = songs.length;

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Recently Played:$l '),
        ),
        body: songs.isEmpty
            ? const Center(
                child: Text('No Songs in\n Recentlyplayed',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  SongModel song = songs[index];
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
