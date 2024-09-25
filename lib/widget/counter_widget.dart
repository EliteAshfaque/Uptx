import 'dart:async';
import 'package:flutter/material.dart';

class TimmerWidget extends StatefulWidget {
  final Duration totalDuration;

  const TimmerWidget({Key? key, required this.totalDuration}) : super(key: key);

  @override
  _TimmerWidgetState createState() => _TimmerWidgetState();
}

class _TimmerWidgetState extends State<TimmerWidget> {
  late Duration remainingTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.totalDuration;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime -= Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "Time Remaining: ${formatDuration(remainingTime)}",
      style: TextStyle(fontSize: 12, color: Colors.yellow),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$hours:$minutes:$seconds";
  }
}
