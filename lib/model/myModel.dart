import 'package:flutter/cupertino.dart';

class MyModel extends ChangeNotifier {
  int number = 0;

  MyModel({this.number = 0});

  Future<void> inAddNum() async {
    await Future.delayed(Duration(seconds: 2));
    number++;
    print(number);
    notifyListeners();
  }
}
