import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyButtonHomePage(),
    );
  }
}
class MyButtonHomePage extends StatelessWidget{
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  MyButtonHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: null,
              child: const Text('Disabled Button'),
            ),
            RaisedButton(
              onPressed: () => _showToast(context),
              child: const Text('Enabled Button'),
            ),
            RaisedButton(
              onPressed: () => _showToast(context),
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.red, Colors.green, Colors.blue],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Text('Gradient Button'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    //final scaffold = Scaffold.of(context);
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: const Text('Snackbar Opened'),
        action: SnackBarAction(
            label: 'Close', onPressed: _scaffoldKey.currentState.hideCurrentSnackBar),
      ),
    );
  }
}

