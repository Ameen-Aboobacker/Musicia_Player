import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: SizedBox(
      width: MediaQuery.of(context).size.height * 0.32,
      height: MediaQuery.of(context).size.width * 0.55,
      child: Image.asset('assets/music logo2-modified (1).png'),
    ));
  }
}