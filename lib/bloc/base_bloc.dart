import 'dart:async';

class BaseBloc<T> {

  StreamController controller = StreamController<T>.broadcast();

  init() {
    controller.stream.listen(add);
  }

  void dispose() {
    controller.close();
  }

  void add(Object T) {
    controller.add(T);
  }

  get output => controller.stream;

  getList(String idCharacter, {int offsetQParam}) async {
    return null;
  }

}