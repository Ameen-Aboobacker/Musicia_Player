import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:musicia/model/muzic_model.dart';

class PlayerController extends ChangeNotifier {
  List<SongModel?> songList = [];
  int currentIndex = 0;
  AudioPlayer audioPlayer = AudioPlayer();
  List<SongModel?> playingList = [];
  SongModel? currentSong;
  int currentIndexes = -1;
  Duration duration = const Duration();
  Duration position = const Duration();
  ConcatenatingAudioSource createSongList(List<SongModel?> songs) {
    List<AudioSource> songList = [];
    playingList = songs;
    for (var song in songs) {
      songList.add(
        AudioSource.uri(
          Uri.parse(song!.uri!),
          tag: MediaItem(
            id: song.id.toString(),
            album: song.album ?? "No Album",
            title: song.title,
            artist: song.artist,
            artUri: Uri.parse(song.id.toString()),
          ),
        ),
      );
    }
    return ConcatenatingAudioSource(children: songList);
  }

  changeIndex() {
    audioPlayer.currentIndexStream.listen((index) {
      if (index != null) {
        currentIndex = index;
        currentSong = playingList[index];
        currentIndexes = index;
      }
    });
  }

  void changeToSeconds(int seconds) {
    Duration duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
    notifyListeners();
  }

  void playSong() {
    audioPlayer.durationStream.listen((eventd) {
      duration = eventd!;
    });
    audioPlayer.positionStream.listen((eventp) {
      position = eventp;
      notifyListeners();
    });
  }

  getSongs() async {
    OnAudioQuery audioQuery = OnAudioQuery();
    final songs = await audioQuery.querySongs();
    songList = [...songs];
  }

  resetApp() async {
    final playListDb = Hive.box<MuzicModel>('Playlists');
    final favorDb = Hive.box<int>('Favorites');
    final recentDb = Hive.box<int>('RecentSongs');
    final mostdb = Hive.box<int>('MostlyPlayedSongs');
    await favorDb.clear();
    await playListDb.clear();
    await recentDb.clear();
    await mostdb.clear();
    audioPlayer.stop;
    currentSong = null;
  }
}
