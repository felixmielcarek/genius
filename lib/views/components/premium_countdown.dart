import 'dart:async';

import 'package:flutter/material.dart';

class PremiumCountdown extends StatefulWidget {
  const PremiumCountdown({super.key});

  @override
  State<PremiumCountdown> createState() => _PremiumCountdownState();
}

class _PremiumCountdownState extends State<PremiumCountdown> {
  final DateTime targetDate = DateTime(2025, 10, 10, 23, 59, 59);
  late Timer _timer;
  Duration _timeRemaining = Duration.zero;

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      setState(() {
        final now = DateTime.now();
        _timeRemaining = targetDate.difference(now);

        if (_timeRemaining.isNegative) {
          _timer.cancel();
          _timeRemaining = Duration.zero;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  @override
  Widget build(BuildContext context) {
    final days = _timeRemaining.inDays;
    final hours = _timeRemaining.inHours % 24;
    final minutes = _timeRemaining.inMinutes % 60;

    return Column(children: [
      Image.asset('assets/images/premium.png'),
      Text(
        "${days}j : ${hours}h : $minutes m",
        style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
      )
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
