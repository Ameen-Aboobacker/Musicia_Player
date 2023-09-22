import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/playlist_controller.dart';
import 'package:musicia/widgets/playlist_components/create_playlist.dart';

import '../../model/muzic_model.dart';
import 'delete_playlist.dart';
import 'edit_playlist.dart';

class UpdateDialogue extends StatelessWidget {
  const UpdateDialogue({
    super.key,
    required this.musicList,
  });
  // final int index;
  final MuzicModel musicList;

  @override
  Widget build(BuildContext context) {
    final db=context.watch<PlaylistController>();
    return SimpleDialog(
      title: Text(
        musicList.name,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      contentPadding: const EdgeInsets.only(top: 10, bottom: 8),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: const Color.fromARGB(255, 12, 137, 144),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
                context: context,
                builder: (ctx) => CreatePlaylist(
                      isEdit: true,
                      list: musicList,
                    ));
            //editplaylist(index, context, controller);
          },
          child: const Row(
            children: [
              Icon(
                Icons.edit,
                color: Colors.white,
              ),
              SizedBox(width: 4),
              Text(
                'Edit playlist Name',
                style: TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.of(context).pop();
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title:const  Text('hi'),
                content: const Text('are you sure ',style: TextStyle(color: Colors.black),),
                actions: [
                  OutlinedButton(onPressed: (){
                    log('pid:${musicList.pid}');
                    db.deletePlaylist(musicList.pid!);
                    Navigator.pop(context);
                  },child: const Text('ok'), ),
                   OutlinedButton(onPressed: (){},child: const Text('cancel'))
                ],
              ),
            );
          },
          child: const Row(
            children: [
              Icon(
                Icons.delete,
                color: Color.fromARGB(255, 227, 8, 8),
              ),
              SizedBox(width: 4),
              Text(
                'Delete',
                style: TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Future editplaylist(index, context, controller) {
  return showDialog(
    context: context,
    builder: (ctx) => EditPlaylist(
      controller: controller,
      index: index,
    ),
  );
}

Future<dynamic> deleteplaylist(contxt, musicList, index) {
  return showDialog(
    context: contxt,
    builder: (context) {
      return DeletePlaylist(musicList: musicList, index: index);
    },
  );
}
