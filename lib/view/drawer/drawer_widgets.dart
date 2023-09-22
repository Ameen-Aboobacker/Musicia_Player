import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
    required this.drawername,
    required this.icon,
    required this.onpressed,
  });
  final String drawername;
  final IconData icon;
  final Function() onpressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18, 18, 8),
      child: Row(
        children: [
           Icon(
            icon,
            color:const  Color.fromARGB(255, 255, 255, 255),
          ),
          TextButton(
            onPressed: onpressed,
            child:  Text(
              drawername,
              style: const TextStyle(
                  fontFamily: 'UbuntuCondensed',
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
