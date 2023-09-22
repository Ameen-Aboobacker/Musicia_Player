import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/view/home_screen.dart';

import '../controller/favcontroller.dart';
import '../widgets/song_tile.dart';
import '../widgets/add_songs_list.dart';
import '../widgets/playlist_components/playlist_songs.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavouriteController>();
    List<SongModel?> favsongs = fav.getSongsByIds();

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        body: favsongs.isEmpty
            ? const Center(
                child: Text('No Songs in\n Favourites',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  SongModel song = favsongs[index]!;
                  return SongTile(
                      song: song,
                      index: index,
                      playinglist: favsongs,
                      trailing: IconButton(
                          onPressed: () {
                            fav.removefav(song);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red)));
                },
                itemCount: favsongs.length,
              ),
        floatingActionButton: AddSongButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => const SongListPage(isfav: true)),
            );
          },
        ),
        bottomNavigationBar: const MiniPlayerConsumer(),
      ),
    );
  }
}
