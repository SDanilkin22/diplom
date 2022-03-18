import 'package:flutter/material.dart'; //импортируем
import 'package:untitled4/screens/auth.dart';
import 'package:untitled4/screens/home.dart';
import 'domain/list.dart';

void main() => runApp(MyApp()); //функция которая позволяет запускать приложение

class MyApp extends StatelessWidget { //виджет без состояния
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //context определяет место в иерархии виджета
    return MaterialApp( 
        title: 'Home Service', //название приложения
        theme: ThemeData( //глобальная тема
        primaryColor: Color.fromRGBO(28, 84, 56, 1),  //основной цвет
     textTheme: TextTheme(titleSmall: TextStyle(color:Colors.white))
      ),
      home: AuthorizationPage()
    );
  }
  }

