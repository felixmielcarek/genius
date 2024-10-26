import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToolsTile extends StatelessWidget {
  final String icon;

  const ToolsTile({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
        badgeStyle: const badges.BadgeStyle(padding: EdgeInsets.all(6)),
        position: badges.BadgePosition.topStart(start: -5),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xff3f54b1)),
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
        ));
  }
}
