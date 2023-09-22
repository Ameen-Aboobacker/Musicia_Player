import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:musicia/model/muzic_model.dart';

class PlaylistController extends ChangeNotifier {
  final playlistDb = Hive.box<MuzicModel>('Playlists');
  MuzicModel? _playlist;
  MuzicModel? get playlist => _playlist;

  Future<void> addPlaylist(MuzicModel value) async {
    final pid = await playlistDb.add(value);
    value.pid = pid;
    await playlistDb.put(pid, value);
    notifyListeners();
  }

  static Future<void> getAllPlaylist() async {
    // final playlistDb = Hive.box<MuzicModel>('playlistDb');
  }
  getSinglePlaylist(int id) {
    _playlist = playlistDb.get(id);
    notifyListeners();
  }

  Future<void> deletePlaylist(int index) async {
    // final playlistDb = Hive.box<MuzicModel>('playlistDb');
    await playlistDb.delete(index);
    getAllPlaylist();
    notifyListeners();
  }

  Future<void> editList(MuzicModel value) async {
    await playlistDb.put(value.pid, value);
    getAllPlaylist();
    notifyListeners();
  }

  void songAddToPlaylist(int songID) {
    playlist!.add(songID);
    notifyListeners();
  }

  void songremoveFromPlaylist(int songID) {
    playlist!.deleteData(songID);
    notifyListeners();
  }
}
