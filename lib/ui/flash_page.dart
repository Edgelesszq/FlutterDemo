import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/common/Application.dart';

class FlashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlashBodyPage();
  }
}

class FlashBodyPage extends StatefulWidget {
  @override
  _FlashBodyPageState createState() => _FlashBodyPageState();
}

class _FlashBodyPageState extends State<FlashBodyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Application.router.navigateTo(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(
        image: AssetImage('images/icon_flash.jpg'),
      ),
    );
  }
}
