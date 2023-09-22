import 'package:on_audio_query/on_audio_query.dart';
 List<SongModel?> songList=[];
getSongs()async {
  OnAudioQuery audioQuery = OnAudioQuery();
final songs = await audioQuery.querySongs();
 songList=[...songs];
}