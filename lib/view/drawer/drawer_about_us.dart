import 'package:flutter/material.dart';
import 'package:musicia/view/drawer/string.dart';
import 'package:musicia/view/home_screen.dart';


class AboutUsDrawer extends StatelessWidget {
  const AboutUsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImage), fit: BoxFit.cover),
        ),
        child: const Padding(
          padding:  EdgeInsets.all(80.0),
          child: Column(
            children: [
              Text( about,
                style: TextStyle(
                  fontFamily: 'UbuntuCondensed',
                  color: Colors.white,
                  fontSize: 19,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
