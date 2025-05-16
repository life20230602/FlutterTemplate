import 'dart:async';

import 'package:flutter/material.dart';

///倒计时
class CountDownTimeWidget extends StatefulWidget {
  const CountDownTimeWidget(
      {super.key,
      required this.countDownTime,
      this.endText = "跳过",
      required this.onClick});

  final int countDownTime;
  final String endText;
  final Function() onClick;

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<CountDownTimeWidget> {
  late Timer _timer;

  var _countdownTime = 0;

  @override
  void initState() {
    super.initState();
    _countdownTime = widget.countDownTime;
    startCountdownTimer();
  }

  @override
  Widget build(BuildContext context) {
    final text = _countdownTime == 0 ? widget.endText : "$_countdownTime";
    return GestureDetector(
      onTap: () {
        if (_countdownTime != 0) {
          return;
        }
        widget.onClick();
      },
      child: Container(
        width: 50,
        height: 28,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(14)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }

  ///开始倒计时
  void startCountdownTimer() {
    const oneSec = Duration(seconds: 1);
    callback(timer) => {
          setState(() {
            if (_countdownTime < 1) {
              _timer.cancel();
            } else {
              _countdownTime = _countdownTime - 1;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}
