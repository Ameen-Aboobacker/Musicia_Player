import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:musicia/fun.dart';
import 'package:musicia/widgets/song_tile.dart';

import '../../controller/search_controller.dart';

class SearchList extends StatelessWidget {
  const SearchList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = context.watch<SearchScreenController>();
    final List<SongModel?> foundSongs = searchController.foundSongs;
    return foundSongs.isNotEmpty
        ? foundSongs.length == songList.length
            ? ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SongTile(
                    index: index,
                    song: foundSongs[index]!,
                    isList: true,
                  );
                },
                itemCount: foundSongs.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10.0,
                  );
                },
              )
            : ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return SongTile(
                    index: index,
                    song: foundSongs[index]!,
                    playinglist: foundSongs,
                  );
                },
                itemCount: foundSongs.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 10.0,
                  );
                },
              )
        : const Center(
            child: Text(
            'No songs available',
            style: TextStyle(color: Colors.white),
          ));
  }
}
