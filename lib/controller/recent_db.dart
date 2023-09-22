import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musicia/fun.dart';

class RecentlyPlayedController extends ChangeNotifier {

  final recentDb = Hive.box<int>('RecentSongs');
  Future<void> addRecentlyPlayed(item) async {
     final itemIndex = recentDb.values.toList().indexOf(item);

    // If the item exists, remove it from its current position
    if (itemIndex != -1) {
      recentDb.deleteAt(itemIndex);
    }
    await recentDb.add(item);
    notifyListeners();
  }

  List<SongModel> getRecentSong()  {
      List<SongModel> recentlyPlayed = [];
    print('hi');
    final recentSongItems = recentDb.values.toList();

    for (int i = 0; i < recentSongItems.length; i++) {
      for (int j = 0; j < songList.length; j++) {
        if (recentSongItems[i] == songList[j]!.id) {
          recentlyPlayed.add(songList[j]!);
        }
      }
    }
    return recentlyPlayed;
  }
  clearDb(){
    recentDb.clear();
    notifyListeners();
  }
}
