import 'package:flutter/material.dart';

import '../resources/genius_colors.dart';

class ProgressFrame extends StatelessWidget {
  final double progress;
  final Widget content;
  final Color background;
  final double frameRadius;
  final double frameThickness;

  const ProgressFrame(
      {super.key,
      required this.progress,
      required this.content,
      required this.background,
      required this.frameRadius,
      required this.frameThickness});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 20),
        width: frameRadius,
        height: frameRadius,
        decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 5)
        ]),
        child: Stack(alignment: Alignment.center, children: [
          SizedBox(
              width: frameRadius - frameThickness,
              height: frameRadius - frameThickness,
              child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 3.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                      GeniusColors.progress.withOpacity(0.7)),
                  backgroundColor: Colors.white)),
          Container(
              width: frameRadius - 2 * frameThickness,
              height: frameRadius - 2 * frameThickness,
              decoration:
                  BoxDecoration(color: background, shape: BoxShape.circle),
              child: ClipOval(child: content))
        ]));
  }
}
