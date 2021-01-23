void main() {
  //expand();
  map();
}

void expand() {
  getNumbers().expand((data) => [data, data * 10]).listen((event) {
    print(event);
  });
}

void map() {
  getNumbers().map((data) => data * 10).listen((event) {
    print(event);
  });
}

Stream<int> getNumbers() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}
