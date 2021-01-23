import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = new StreamController();

  final order = new Order('banana');

  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) => {
      if (cakeType == 'chocalate')
        {sink.add(new Cake())}
      else
        {sink.addError("i can't bake that!")}
    },
  );

  controller.sink.add(order);

  controller.stream.map((data) => data.type).transform(baker).listen(
      (data) => print('Here is the $data'),
      onError: (err) => print(err));
}
