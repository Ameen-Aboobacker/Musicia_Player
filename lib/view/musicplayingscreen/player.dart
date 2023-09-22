import 'package:flutter/material.dart';

import '../../widgets/player_components/add_to_fav.dart';
import '../../widgets/player_components/add_to_playlist.dart';
import '../../widgets/player_components/logo.dart';
import '../../widgets/player_components/player_buttons.dart';
import '../../widgets/player_components/slider_widget.dart';
import '../../widgets/player_components/song_details.dart';
import '../../widgets/player_components/title_bar.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            const TitleBar(),
            const SizedBox(height: 50),
            const LogoWidget(),
             SizedBox(height: size.height * 0.075),
             
            const SongDetails(),
            SizedBox(height: size.height * 0.075),
            const SliderWidget(),
            SizedBox(height: size.height * 0.075),
            const PlayerButtons(),
            SizedBox(height: size.height * 0.05),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddToPlaylist(),
                AddToFav(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
