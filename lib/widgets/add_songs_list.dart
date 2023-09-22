import 'package:flutter/material.dart';
import 'package:musicia/fun.dart';

import '../view/home_screen.dart';
import 'song_tile.dart';
import 'trailing_button.dart';

class SongListPage extends StatelessWidget {
  const SongListPage({super.key, this.isfav = false});

  final bool isfav;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final song = songList[index];
              return SongTile(
                song: song!,
                index: index,
                isList: true,
                trailing: Trailing(
                  isfav: isfav,
                  song: song,
                ),
              );
            },
            itemCount: songList.length,
            separatorBuilder: (context, index) {
              return const Divider(
                height: 10.0,
              );
            },
          ),
        ),
        bottomNavigationBar: const MiniPlayerConsumer(),
      ),
    );
  }
}
