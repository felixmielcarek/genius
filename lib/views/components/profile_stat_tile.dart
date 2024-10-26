import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileStatTile extends StatelessWidget {
  const ProfileStatTile(
      {super.key,
      this.icon,
      this.valueIcon,
      required this.title,
      required this.value});

  final String? icon;
  final String? valueIcon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 3)
            ]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) SvgPicture.asset(icon!, height: 40),
              Center(
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                        Text(value.toString(),
                            style: const TextStyle(fontSize: 26)),
                        if (valueIcon != null)
                          Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: SvgPicture.asset(valueIcon!, height: 26))
                      ]))),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12))
            ]));
  }
}

//Navigator.pop(context);
