import 'package:flutter/material.dart';
import 'package:musicia/view/drawer/string.dart';
import 'package:musicia/view/home_screen.dart';

class PrivacyDrawer extends StatelessWidget {
  const PrivacyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImage), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 25, left: 18),
            child: ListView(
              children: [
                const Text(
                  "Privacy Policy for Zing",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                const Text(
                  privacy,
                  style: TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.verified)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
