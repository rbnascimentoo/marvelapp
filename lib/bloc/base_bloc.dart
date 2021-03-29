import 'dart:async';

class BaseBloc<T> {

  final StreamController _controller = StreamController<T>.broadcast();

  init() {
    _controller.stream.listen(add);
  }

  void dispose() {
    _controller.close();
  }

  void add(Object T) {
    _controller.sink.add(T);
  }

  get output => _controller.stream;

  getList(String idCharacter, {int limitQParam, int offsetQParam}) async {
    return null;
  }

}