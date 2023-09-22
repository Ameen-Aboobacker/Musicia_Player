import 'dart:async';
//import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:musicia/view/home_screen.dart';

import '../fun.dart';

//import '../fun.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final OnAudioQuery _audioQuery = OnAudioQuery();
  @override
  void initState() {
    super.initState();
    requestPermission();
    goToHome(context);
  }

void requestPermission() async {
  Map<Permission, PermissionStatus> status = await [
    Permission.storage,
    // Add any other necessary permissions here
  ].request();

  if (status[Permission.storage] == PermissionStatus.granted) {
    // Permission granted, you can proceed with accessing the audio library
    // Call the getSongs() method or any other audio-related operation here
    await getSongs();
  } else {
    // Handle the case when the user denies the permission
    // You can show a message or request the permission again
  }

  setState(() {});
}


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(image: AssetImage('assets/Musicia-removebg-preview.png'))),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Loading....'),
              SizedBox(height: 30,),
               CircularProgressIndicator(),
              SizedBox(height: 100,)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToHome(context) async {
    Timer(const Duration(seconds: 5), (() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }));
  }
}
