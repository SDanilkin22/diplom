import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled4/domain/authuser.dart';
import 'package:untitled4/services/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthorizationPage extends StatefulWidget {
  AuthorizationPage({Key? key}) : super(key: key);

  @override
  _AuthorizationPageState createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  late String _email;
  late String _password;
  bool showLogin = true;

  AuthService _authService = AuthService();


  @override //заголовок
  Widget build(BuildContext context) {
    Widget _logo() {
      //добавляем лого
      return Padding(
          padding: EdgeInsets.only(top: 100), //отступы только сверху
          child: Container(
              //основной метод
              child: Align(
                  //центрированное лого (по умолчанию)
                  child: Text('HOME SERVICE',
                      style: TextStyle(
                          fontSize: 45, //размер
                          fontWeight: FontWeight.bold, //жирный
                          color: Colors.lightGreenAccent)) //цвет
                  )));
    }

    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obscure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obscure, //контроль пароля
          style: TextStyle(fontSize: 20, color: Colors.white),
          decoration: InputDecoration(
              hintStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)),
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                      data: IconThemeData(color: Colors.white), child: icon))),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        splashColor: Theme.of(context).primaryColor,
        //эффект нажатия
        highlightColor: Theme.of(context).primaryColor,
        color: Colors.white,
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
                fontSize: 20)),
        onPressed: () {
          func();
        },
      );
    }

    Widget _form(String label, void func()) {
      return Container(
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(bottom: 20, top: 10),
                child: _input(
                    Icon(Icons.email), "Логин", _emailController, false)),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(
                    Icon(Icons.lock), "Пароль", _passwordController, true)),
            SizedBox(
              height: 20,
            ), //отступ
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: 50,
                    width: MediaQuery.of(context)
                        .size
                        .width, //доступ к параметрам общего экрана
                    child: _button(label, func) //отдельный виджет для кнопки
                    ))
          ],
        ),
      );
    }

    void _loginButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      AuthUser? user;
      user = await _authService.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null)
      {

        Fluttertoast.showToast(
            msg: "Не удается войти в систему! Проверьте свой логин/пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButtonAction() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      AuthUser? user;
      user = await _authService.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null)
      {

        Fluttertoast.showToast(
            msg: "Не удалось зарегистрироваться! Проверьте свой логин/пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );

      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }


    Widget _bottomWave() {
      return Expanded(
        child: Align(
          child: ClipPath(
            child: Container(
              color: Colors.white,
              height: 300,
            ),
            clipper: BottomWaveClipper(),
          ),
          alignment: Alignment.bottomCenter,
        ),
      );
    }



    return Scaffold(
        //класс для создания отдельной страницы
        backgroundColor: Color.fromRGBO(00, 38, 46, 1),
        body: Column(
          // колонка
          children: <Widget>[
            _logo(), //лого
            SizedBox(height: 50,),
            (
                showLogin
                ? Column(
                    children: <Widget>[
                      _form('ВХОД', _loginButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            child: Text('Новый пользователь? Регистрация!',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onTap: () {
                              setState(() {
                                showLogin = false;
                              });
                            }),
                      )
                    ],
                  )
                : Column(
                    children: <Widget>[
                      _form('РЕГИСТРАЦИЯ', _registerButtonAction),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: GestureDetector(
                            child: Text('Уже зарегистрированы? Вход!',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onTap: () {
                              setState(() {
                                showLogin = true;
                              });
                            }),
                      )
                    ],
                  ))
          ],
        ));
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
