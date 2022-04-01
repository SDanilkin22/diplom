import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart'; //импортируем
import 'package:untitled4/screens/auth.dart';
import 'package:untitled4/screens/home.dart';
import 'package:untitled4/screens/landing.dart';
import 'package:untitled4/services/auth.dart';
import 'domain/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'domain/authuser.dart';
//функция которая позволяет запускать приложение

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget { //виджет без состояния
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //context определяет место в иерархии виджета
    return StreamProvider<AuthUser?>.value(
      value: AuthService().currentUser,
    initialData: null,
    child: MaterialApp(
        title: 'Home Service', //название приложения
        theme: ThemeData( //глобальная тема
        primaryColor: Color.fromRGBO(28, 84, 56, 1),  //основной цвет
     textTheme: TextTheme(titleSmall: TextStyle(color:Colors.white))
      ),
      home: LandingPage()
    ),
    );
  }
  }
