import 'package:flutter/material.dart';
class EditPlaylist extends StatelessWidget {
  const EditPlaylist({

    super.key, required this.controller,  required this.index,
  });
  final TextEditingController controller;

  final int index;
  @override
  Widget build(BuildContext context) {
      final GlobalKey<FormState> formkey=GlobalKey<FormState>();
    return SimpleDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      backgroundColor: const Color.fromARGB(255, 15, 159, 167),
      children: [
        const SimpleDialogOption(
          child: Text(
            'Edit Playlist Name',
            style: TextStyle(
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
            key: formkey,
            child: TextFormField(
              controller: controller,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Enter your playlist name";
                } else {
                  return null;
                }
              },
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
              onPressed: () {
                //updateplaylistname(index, formkey, controller);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Update',
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
/*void updateplaylistname(index, formkey, playlistname) {
  if (formkey.currentState!.validate()) {
    final names = playlistname.text.trim();
    if (names.isEmpty) {
      return;
    } else {
      final playlistnam = MuzicModel(name: names, songId: []);
      PlaylistDb.editList(index, playlistnam);
    }
  }
}*/
