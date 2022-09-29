import 'dart:async';

import 'package:flutter/foundation.dart';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({this.milliseconds = 400});

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) _timer!.cancel();

    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  // Do not forget to dispose the timer so that it will not run when you change screen.
  void dispose() {
    if (_timer != null) _timer!.cancel();
  }
}
