import 'dart:async';

class BaseBloc<T> {

  final StreamController _controller = StreamController<T>.broadcast();

  void dispose() {
    _controller.close();
  }

  void add(Object T) {
    _controller.add(T);
  }

  get output => _controller.stream;

}