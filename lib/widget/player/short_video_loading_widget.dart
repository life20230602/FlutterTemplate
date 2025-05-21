import 'dart:async';

import 'package:flutter/material.dart';

class ShortVideoLoadingWidget extends StatefulWidget {
  const ShortVideoLoadingWidget({super.key});

  @override
  _ShortVideoLoadingWidgetState createState() =>
      _ShortVideoLoadingWidgetState();
}

class _ShortVideoLoadingWidgetState extends State<ShortVideoLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstProgressAnimation;
  late Animation<double> _secondProgressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat();

    _firstProgressAnimation = Tween<double>(begin: 0.1, end: 0.99).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _secondProgressAnimation = Tween<double>(begin: 0.1, end: 0.99).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AnimatedBuilder(
            animation: _firstProgressAnimation,
            builder: (context, child) {
              return RotatedBox(
                quarterTurns: 2,
                child: LinearProgressIndicator(
                  minHeight: 1.5,
                  value: _firstProgressAnimation.value,
                  backgroundColor: Colors.transparent,
                  color: Colors.white,
                ),
              );
            },
          ),
        ),
        Expanded(
          child: AnimatedBuilder(
            animation: _secondProgressAnimation,
            builder: (context, child) {
              return LinearProgressIndicator(
                minHeight: 1.5,
                value: _secondProgressAnimation.value,
                backgroundColor: Colors.transparent,
                color: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
