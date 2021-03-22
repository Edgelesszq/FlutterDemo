import 'package:flutter/material.dart';
import 'package:flutter_arg_demo/model/myModel.dart';
import 'package:flutter_arg_demo/model/myModel2.dart';
import 'package:flutter_arg_demo/widget/myHomeApp.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyHomeApp(
      bodyWidget: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MyModel()),
          ChangeNotifierProvider(create: (context) => MyModel2())
        ],
        child: TestBodyPage(),
      ),
    );
  }
}

class TestBodyPage extends StatefulWidget {
  @override
  _TestBodyPageState createState() => _TestBodyPageState();
}

class _TestBodyPageState extends State<TestBodyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Builder(builder: (context) {
            MyModel2 _model2 = Provider.of<MyModel2>(context, listen: true);
            MyModel _model = Provider.of<MyModel>(context, listen: true);
            return FlatButton(
                onPressed: () {
                  _model.inAddNum();
                  _model2.inAddNum();
                },
                child: Text("add"));
          }),
          Builder(builder: (context) {
            MyModel2 _model2 = Provider.of<MyModel2>(context, listen: true);
            MyModel _model = Provider.of<MyModel>(context, listen: true);
            return Text('${_model.number + _model2.number} ');
          }),
          Consumer<MyModel2>(builder: (context, model, child) {
            return Text("${model.number}");
          })
        ],
      ),
    );
  }
}
