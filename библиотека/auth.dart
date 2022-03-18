import 'package:flutter/material.dart';

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


  @override //заголовок
  Widget build(BuildContext context) {
    Widget _logo() {
      //добавляем лого
      return Padding(
          padding: EdgeInsets.only(top: 100), //отступы только сверху
          child: Container( //основной метод
              child: Align( //центрированное лого (по умолчанию)
                  child: Text(
                      'HOME SERVICE', style: TextStyle(fontSize: 45, //размер
                      fontWeight: FontWeight.bold, //жирный
                      color: Colors.lightGreenAccent)) //цвет
              )
          )
      );
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
              hintStyle: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white30),
              hintText: hint,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white54, width: 1)
              ),
              prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: IconTheme(
                      data: IconThemeData(color: Colors.white),
                      child: icon
                  )
              )
          ),
        ),
      );
    }

    Widget _button(String text, void func()) {
      return RaisedButton(
        splashColor: Theme
            .of(context)
            .primaryColor,
        //эффект нажатия
        highlightColor: Theme
            .of(context)
            .primaryColor,
        color: Colors.white,
        child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, color: Theme
                .of(context)
                .primaryColor, fontSize: 20)
        ),
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
                    Icon(Icons.email), "Логин", _emailController, false)
            ),
            Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: _input(
                    Icon(Icons.lock), "Пароль", _passwordController, true)
            ),
            SizedBox(height: 20,), //отступ
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                    height: 50,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width, //доступ к параметрам общего экрана
                    child: _button(label, func) //отдельный виджет для кнопки
                )
            )
          ],
        ),
      );
    }

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
    }

    return Scaffold( //класс для создания отдельной страницы
        backgroundColor: Color.fromRGBO(00, 38, 46, 1),
    body: Column( // колонка
    children:<Widget>[
    _logo(), //лого
    (
    showLogin
    ? Column(
    children: <Widget>[
    _form('ВХОД', _buttonAction),
    Padding(
        padding: EdgeInsets.all(10),
    child: GestureDetector(
    child: Text('Не зарегистрированы? Регистрируйтесь!',style: TextStyle(fontSize: 20,color: Colors.white )),
    onTap:(){
      setState(){
        showLogin = false;
    }
    }
    ),
    )
    ],
  }

