import 'package:flutter/src/scheduler/ticker.dart';

mixin SingleTickerProvider implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}
