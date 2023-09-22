import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musicia/fun.dart';
import 'package:musicia/view/mini_player.dart';
import 'package:musicia/view/search/search_screen.dart';
import 'package:musicia/widgets/home_components/more_home.dart';

import '../controller/player_controller.dart';
import '../widgets/home_components/folder_widget.dart';
import '../widgets/song_tile.dart';
import 'drawer/drawers.dart';
const  String bgImage='assets/bg.jpg';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
log('home');
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const SafeArea(
              child: Drawer(
            child: HomescreenDrawers(),
          )),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              'MUSICIA',
              style: TextStyle(
                  fontFamily: 'UbuntuCondensed',
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (cntxt) => const SearchScreen()));
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 12),
                child: Text(
                  'Libraries',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Folder(),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 20,
                  bottom: 10,
                ),
                child: Text(
                  'All Songs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final song = songList[index]!;
                    return SongTile(
                      song: song,
                      index: index,
                      playinglist: songList,
                      trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => MoreDialogue(song: song),
                            );
                          },
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    );
                  },
                  itemCount: songList.length,
                ),
              ),
            ],
          ),
          bottomNavigationBar: MiniPlayerConsumer()
          ),
    );
  }
}

class MiniPlayerConsumer extends StatelessWidget {
  const MiniPlayerConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerController>(
      builder: (context, value, child) {
     if(value.currentSong!=null){
      return const MiniPlayer();
     }
        return const SizedBox();
      },
    );
  }
}
