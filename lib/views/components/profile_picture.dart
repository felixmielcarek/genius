import 'dart:typed_data';

import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {super.key,
      required this.picture,
      required this.background,
      required this.frameThickness,
      required this.height});

  final Uint8List picture;
  final Color background;
  final double frameThickness;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: frameThickness),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)
            ]),
        child: ClipOval(child: Image.memory(picture, height: height)));
  }
}
