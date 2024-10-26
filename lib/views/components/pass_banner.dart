import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../resources/genius_colors.dart';

class PassBanner extends StatelessWidget {
  const PassBanner({super.key, required this.points});

  final int points;

  @override
  Widget build(BuildContext context) {
    var frFormat = NumberFormat("#,###", "fr_FR");

    return SizedBox(
        height: 130,
        child: Stack(alignment: Alignment.topCenter, children: [
          Container(
              height: 100,
              width: 310,
              decoration: BoxDecoration(
                  color: GeniusColors.lightBlue,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 3),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2), blurRadius: 2)
                  ]),
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    top: -5,
                    child: Stack(children: <Widget>[
                      ImageFiltered(
                          imageFilter:
                              ImageFilter.dilate(radiusX: 1, radiusY: 1),
                          child: Image.asset('assets/images/gamepass.png',
                              color: Colors.white, width: 180)),
                      Image.asset('assets/images/gamepass.png', width: 180)
                    ])),
                Positioned(
                    top: 44,
                    left: 24,
                    child: Container(
                        width: 234, height: 18, color: GeniusColors.secondary)),
                Positioned(
                    top: 42,
                    left: 20,
                    child: Container(
                      width: 140,
                      height: 22,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: GeniusColors.primary),
                    )),
                Positioned(
                    top: 20,
                    child: Image.asset('assets/images/progressbar.png',
                        width: 300)),
                Positioned(
                    top: 43,
                    left: 50,
                    child: Text(frFormat.format(points),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GeniusColors.textLight))),
                const Positioned(
                    top: 43,
                    left: 215,
                    child: Text("2000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GeniusColors.primary)))
              ])),
          Positioned(
              top: 82,
              child: Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: GeniusColors.primary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3), blurRadius: 3)
                      ],
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: const Text("Voir plus",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: GeniusColors.textLight))),
                    Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 20))
                  ])))
        ]));
  }
}
