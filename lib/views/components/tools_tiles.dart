import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genius/views/components/tools_tile.dart';

class ToolsTiles extends StatelessWidget {
  const ToolsTiles({super.key});

  @override
  Widget build(BuildContext context) {
    double separation = 18;

    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      const ToolsTile(icon: 'assets/icons/screw.svg'),
      Container(
          margin: EdgeInsets.only(top: separation),
          child: const ToolsTile(icon: 'assets/icons/trophy.svg')),
      Container(
          margin: EdgeInsets.only(top: separation),
          child: const ToolsTile(icon: 'assets/icons/postit.svg')),
      Container(
          margin: EdgeInsets.only(top: separation),
          padding: const EdgeInsets.all(5),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0xff3f54b1)),
          child:
              SvgPicture.asset('assets/icons/share.svg', color: Colors.white))
    ]);
  }
}
