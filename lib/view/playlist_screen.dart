import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/playlist_controller.dart';
import 'package:musicia/widgets/playlist_components/playlist_view.dart';

import '../widgets/playlist_components/create_playlist.dart';
import 'home_screen.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlistdb = context.watch<PlaylistController>();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Playlists'),
          actions: [
            IconButton(
                onPressed: () {
                  playlistdb.playlistDb.clear();
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [SizedBox(height: 20), PlaylistView()],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            newplaylist(context: context);
            // play.clear();
          },
          child: const Icon(Icons.playlist_add_outlined)
        ),
        bottomNavigationBar: const MiniPlayerConsumer(),
      ),
    );
  }
}

Future newplaylist({required BuildContext context, bool isHome = false, song}) {
  return showDialog(
    context: context,
    builder: (ctx) => CreatePlaylist(
      isHome: isHome,
      sid: song,
    ),
  );
}
