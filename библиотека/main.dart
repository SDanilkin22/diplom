import 'package:flutter/material.dart'; //импортируем
import 'domain/list.dart';

void main() => runApp(MyApp()); //функция которая позволяет запускать приложение

class MyApp extends StatelessWidget { //виджет без состояния
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //context определяет место в иерархии виджета
    return MaterialApp( 
        title: 'Home Service', //название приложения
        theme: ThemeData( //глобальная тема
        primaryColor: Color.fromRGBO(65, 105, 225, 1),  //основной цвет
     textTheme: TextTheme(titleSmall: TextStyle(color:Colors.white))
      ),
      home: HomePage()
    );
  }
  }

  class HomePage extends StatelessWidget {
  const HomePage ({Key? key}) :super (key: key);

     @override
     Widget build(BuildContext context) {
       return Container(
         child: Scaffold(
           backgroundColor: Theme.of(context).primaryColor,
           appBar: AppBar(title: Text('Home Service'), leading: Icon(Icons.account_balance),), //leading иконка слева
           body: WorkoutList(),
         ),
       );
     }
   }

   class WorkoutList extends StatelessWidget{


  final workouts= <Workout>[
    Workout(title: 'test1',author: 'Alex1',description: 'Test description1',level: 'Begginer1'),
    Workout(title: 'test2',author: 'Alex2',description: 'Test description2',level: 'Begginer2'),
    Workout(title: 'test3',author: 'Alex3',description: 'Test description3',level: 'Begginer3'),
    Workout(title: 'test4',author: 'Alex4',description: 'Test description4',level: 'Begginer4'),
    Workout(title: 'test5',author: 'Alex5',description: 'Test description5',level: 'Begginer5'),
  ];

  @override
     Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
        itemBuilder: (context, i){
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  title: Text(workouts[i].title),
                ),
              ),
            );
    }
      ),
    ),
    );
  }
}
