import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:musicia/controller/playlist_controller.dart';

import '../../model/muzic_model.dart';

class CreatePlaylist extends StatelessWidget {
  const CreatePlaylist({
    super.key,
    this.isEdit = false,
    this.isHome = false,
    this.list, 
    this.sid,
  });
  final bool isEdit;
  final bool isHome;
  final MuzicModel? list;
  final int? sid;
  @override
  Widget build(BuildContext context) {
    final playlistdb = context.watch<PlaylistController>();
    TextEditingController nameController = TextEditingController();
    nameController.text = list == null ? '' : list!.name;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: const Color.fromARGB(255, 45, 98, 243),
      children: [
        SimpleDialogOption(
          child: Text(
            isEdit ? 'Edit name' : 'New to Playlist',
            style: const TextStyle(
                fontFamily: 'UbuntuCondensed',
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SimpleDialogOption(
          child: Form(
            key: formKey,
            child: TextFormField(
              controller: nameController,
              maxLength: 15,
              decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(0.7),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding: const EdgeInsets.only(left: 15, top: 5)),
              style: const TextStyle(
                  fontFamily: 'UbuntuCondensed',
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                nameController.clear();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                    fontFamily: 'UbuntuCondensed',
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SimpleDialogOption(
              onPressed: isEdit
                  ? () {
                      if (formKey.currentState!.validate()) {
                        editPlaylist(
                            name: nameController.text.trim(),
                            playlist: list!,
                            playlistdb: playlistdb);
                      }
                    }
                  :  () {
                          if (formKey.currentState!.validate()) {
                            createPlaylist(
                              context: context,
                              playlistdb: playlistdb,
                              nameController: nameController,
                              isHome: isHome,
                              song:sid,
                            );
                          }
                        }
                  ,
              child: isEdit
                  ? const Text(
                      'Edit',
                      style: TextStyle(
                          fontFamily: 'UbuntuCondensed',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  : const Text(
                      'Create',
                      style: TextStyle(
                          fontFamily: 'UbuntuCondensed',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
            ),
          ],
        ),
      ],
    );
  }
}

Future<void> createPlaylist(
    {context, playlistdb, nameController, isHome, song}) async {
  final name = nameController.text.trim();
  final List<int> list=isHome?[song]:[];
  final music = MuzicModel(name: name, songId: list);

  final datas = playlistdb.playlistDb.values.map((e) => e.name.trim()).toList();
  if (name.isEmpty) {
    return;
  } else if (datas.contains(music.name)) {
    SnackBar snackbar = const SnackBar(
        duration: Duration(milliseconds: 750),
        backgroundColor: Colors.black,
        content: Text(
          'playlist already exist',
          style: TextStyle(color: Colors.white),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).pop();
  } else {
    playlistdb.addPlaylist(music);
    log(music.songId.toString());
    SnackBar snackbar = const SnackBar(
        duration: Duration(milliseconds: 750),
        backgroundColor: Colors.black,
        content: Text(
          'playlist created successfully',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).pop();
  }
}

void editPlaylist(
    {required final String name,
    required PlaylistController playlistdb,
    required MuzicModel playlist}) {
  if (name.isEmpty) {
    return;
  } else {
    log('before: ');
    log(playlist.name);
    playlist.name = name;
    log('after: ');
    log(playlist.pid.toString());
    playlistdb.editList(playlist);
  }
}
