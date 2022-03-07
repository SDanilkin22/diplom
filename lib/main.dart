import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Which service do you need?',
       theme: ThemeData(primarySwatch: Colors.amber),
    home: HomePage(),

    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Диплом')),
      body: Container(
        child: Center(
          child: Text('Which service do you need?'),
        ),
      ),
    );
  }
}
