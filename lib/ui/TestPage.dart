import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      bodyWidget: Container(
        child: Center(
          child: Text("NUBs"),
        ),
      ),
    );
  }
}
