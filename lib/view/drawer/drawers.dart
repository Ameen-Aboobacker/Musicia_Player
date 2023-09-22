import 'dart:developer';

import 'package:flutter/material.dart';

import 'drawer_about_us.dart';
import 'drawer_privacy.dart';
import 'drawer_widgets.dart';
import 'reset_alert.dart';

class HomescreenDrawers extends StatelessWidget {
  const HomescreenDrawers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Image(
              image: AssetImage(
                'assets/Musicia-removebg-preview.png',
              ),
              fit: BoxFit.fill,
            ),
            Column(children: [
              DrawerContent(
                drawername: 'About Us ',
                icon: Icons.person,
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutUsDrawer()));
                },
              ),
              DrawerContent(
                drawername: 'Privacy & Policy',
                icon: Icons.lock_person_rounded,
                onpressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const PrivacyDrawer()));
                },
              ),
              DrawerContent(
                drawername: 'Share App',
                icon: Icons.share,
                onpressed: () {
                  log('share');
                },
              ),
              DrawerContent(
                drawername: 'Reset App',
                icon: Icons.replay_circle_filled,
                onpressed: () {
                  resetDialogue(context);
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Future<dynamic> resetDialogue(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return const ResetAlert();
      },
    );
  }
}
