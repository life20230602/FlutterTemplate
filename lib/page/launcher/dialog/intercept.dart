import 'package:flutter/material.dart';

abstract class InterceptChain {
  InterceptChain(this.context);
  InterceptChain? chain;
  BuildContext context;

  void intercept(InterceptChain? chain);

  void next() {
    intercept(chain);
  }
}

class InterceptChainHandler<T> {
  InterceptChain? _interceptFirst;

  void add(InterceptChain interceptChain) {
    if (_interceptFirst == null) {
      _interceptFirst = interceptChain;
      return;
    }
    InterceptChain node = _interceptFirst!;
    while (true) {
      if (node.chain == null) {
        node.chain = interceptChain;
        break;
      }
      node = node.chain!;
    }
  }

  void start() {
    _interceptFirst?.next();
  }
}
