import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        const SizedBox(
          width: 60,
        ),
        const Text(
          '...NOW PLAYING...',
          style: TextStyle(fontSize: 20, color: Colors.white),
        )
      ],
    );
  }
}