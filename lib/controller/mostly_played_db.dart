import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musicia/fun.dart';

class MostlyPlayedController extends ChangeNotifier {
  final mostplayedDb = Hive.box<int>('MostlyPlayedSongs');
   List<SongModel?> mostlyPlayed = [];
  void addmostlyPlayed(int item) async {
    int count=(mostplayedDb.get(item)??0)+1;
      await mostplayedDb.put(item,count);
  

  }

  Future<void> getMostlyPlayedSongs() async {
    final Map<dynamic, int> itemCountMap = mostplayedDb.toMap();
    mostlyPlayed.clear();
    final mostlyPlayedsongs = itemCountMap.entries
        .where((entry) => entry.value >= 3)
        .map((entry) => entry.key)
        .toList();

    final songs = mostlyPlayedsongs
        .map((songId) => songList.firstWhere((song) => song!.id == songId,
            orElse: () => null))
        .where((song) => song != null)
        .toList();

    mostlyPlayed.addAll(songs);
  }
}
