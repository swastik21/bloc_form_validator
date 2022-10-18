import 'dart:async';

import 'package:flutter/rendering.dart';

enum Status { unknown, loading, loaded }

class TestRepo {
  final _controller = StreamController<Status>();

  Stream<Status> get status async* {
    yield Status.unknown;
    yield* _controller.stream;
  }

  pageLoaded() async {
    await Future.delayed(const Duration(seconds: 3));
    debugPrint("in repo");
    _controller.add(Status.loaded);
  }

  dispose() => _controller.close();
}
