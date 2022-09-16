import 'dart:async';

class GodController {
  StreamController<int> horizontalScrollEvents = StreamController.broadcast();
  StreamController<int> verticalScrollEvents = StreamController.broadcast();
}