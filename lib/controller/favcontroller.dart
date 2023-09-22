import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../fun.dart';

class FavouriteController extends ChangeNotifier {
  final favDb = Hive.box<int>('Favorites');
  isFavorite(song) {
    if (favDb.values.contains(song.id)) {
      return true;
    }
    return false;
  }

  Future<void> addfav(SongModel item) async {
    await favDb.add(item.id);
    notifyListeners();
  }

  List<SongModel?> getSongsByIds() {
    return songList.where((e) => favDb.values.contains(e!.id)).toList();
  }

  Future<void> removefav(SongModel item) async {
    int deletekey = 0;
    if (!favDb.values.contains(item.id)) {
      return;
    }
    final Map<dynamic, int> favorMap = favDb.toMap();
    favorMap.forEach((key, value) {
      if (value == item.id) {
        deletekey = key;
      }
    });
    favDb.delete(deletekey);
    notifyListeners();
  }
}
