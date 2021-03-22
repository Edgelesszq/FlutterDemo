import 'package:flutter/cupertino.dart';

class MyModel2 extends ChangeNotifier {
  int number = 0;

  MyModel2({this.number = 0});

  Future<void> inAddNum() async {
    await Future.delayed(Duration(seconds: 2));
    number++;
    print(number);
    notifyListeners();
  }
}
