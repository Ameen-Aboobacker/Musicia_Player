import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../model/muzic_model.dart';

class DeletePlaylist extends StatelessWidget {
  const DeletePlaylist({
    super.key,
    required this.musicList, required this.index
  });
  final Box<MuzicModel> musicList;
  final int index;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 15, 159, 167),
      title: const Text(
        'Delete Playlist',
        style: TextStyle(
            fontFamily: 'UbuntuCondensed',
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      content: const Text(
        'Are you sure you want to delete this playlist?',
        style: TextStyle(
          fontFamily: 'UbuntuCondensed',
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 15,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'No',
            style: TextStyle(
              fontFamily: 'UbuntuCondensed',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            
            Navigator.pop(context);
            SnackBar snackBar = const SnackBar(
              backgroundColor: Colors.black,
              content: Text(
                'Playlist is deleted',
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(milliseconds: 350),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: const Text(
            'Yes',
            style: TextStyle(
              fontFamily: 'UbuntuCondensed',
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}