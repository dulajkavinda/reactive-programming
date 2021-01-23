void main() {
  //listen();
  //awaitFor();
  //isEmpty();
  //first();
  //last();
  //length();
  //single();
  //any();
  contains();
}

void first() async {
  print(await getNumbers().first);
}

void last() async {
  print(await getNumbers().last);
}

void length() async {
  print(await getNumbers().length);
}

void single() async {
  print(await getNumbers().single);
}

void any() async {
  if (await getNumbers().any((int i) => i == 3)) {
    print('Number is equal to 3');
  }
}

void contains() async {
  if (await getNumbers().contains(3)) {
    print('Number is equal to 3');
  }
}

void isEmpty() async {
  if (await getNumbers().isEmpty) {
    print("stream is empty");
  } else {
    print("stream is not empty");
  }
}

void awaitFor() async {
  var sum = 0;
  await for (var number in getNumbers()) {
    sum += number;
  }
  print(sum);
}

void listen() async {
  getNumbersException().listen((data) {
    print(data);
  });

  getNumbersException().listen((data) {
    print(data);
  }).onError((error) => print("Error Occured"));

// onDone
  var sum = 0;
  getNumbers().listen((data) {
    sum += data;
  }).onDone(() {
    print(sum);
  });
}

Stream<int> getNumbers() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

Stream<int> getNumbersException() async* {
  for (int i = 1; i <= 3; i++) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
    if (i == 2) {
      throw Exception();
    }
  }
}
