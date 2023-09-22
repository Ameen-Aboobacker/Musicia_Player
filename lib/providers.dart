import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:musicia/controller/player_controller.dart';
import 'package:musicia/controller/search_controller.dart';

import 'controller/favcontroller.dart';
import 'controller/mostly_played_db.dart';
import 'controller/playlist_controller.dart';
import 'controller/recent_db.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (context) => FavouriteController()),
  ChangeNotifierProvider(create: (context) => PlaylistController()),
  ChangeNotifierProvider(create: (context) => RecentlyPlayedController()),
  ChangeNotifierProvider(create: (context) => MostlyPlayedController()),
  ChangeNotifierProvider(create: (context) => SearchScreenController()),
   ChangeNotifierProvider(create: (context) => PlayerController()),
];
