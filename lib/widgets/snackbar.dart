import 'package:flutter/material.dart';

class SnackBarWidget {
  final BuildContext context;
  SnackBarWidget(this.context);
   snackBar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        ),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,

      ),
    );
  }
}