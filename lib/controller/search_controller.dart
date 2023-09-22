import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musicia/fun.dart';

class SearchScreenController extends ChangeNotifier{
List<SongModel?> foundSongs = songList;

    void search(String enteredKeyword) {
    List<SongModel?> results = [];
    String name=enteredKeyword.trim();
    if (name.isEmpty) {
      results = songList;
    } else {
      results = songList
          .where((element) => element!.displayNameWOExt.startsWith(name))
          .toList();
    }
    
      foundSongs = results;
   notifyListeners();
  }
}