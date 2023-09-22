import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  const FolderCard(
      {Key? key, required this.title, required this.icon, required this.onTap,required this.color})
      : super(key: key);
  final String title;
  final IconData? icon;
  final Color? color;

  final Function()? onTap;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          color:color,
          margin: const EdgeInsets.only(
            left: 20,
            top: 30,
            right: 10,
          ),
          child: SizedBox(
              height: 130,
              width: 130,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                 Icon(
                  icon,size: 30,
                ),
                Text(
                  title,textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
               
              ]))),
    );
  }
}
