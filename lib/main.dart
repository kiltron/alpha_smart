import 'package:alpha_smart/page1.dart';
import 'package:alpha_smart/page21.dart';
import 'package:flutter/material.dart';
import 'package:alpha_smart/account_page.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphaSMART',
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Color? unlockedColor = Colors.greenAccent;
  Color? lockedColor = Colors.grey[400];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Главное меню'),
        backgroundColor: Color.fromARGB(255, 252, 220, 37),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AccountPage()),
                        );
                      },
                      child: Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 20, 5),
                          child: Image.asset(
                            'assets/images/account_icon.png',
                            scale: 1.5,
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        '6 класс',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ]),
            ],
          ),
          Container(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: const Text(
              'Десятичные дроби',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: () {
              globals.test1 = 0;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FirstPage()),
              );
            },
            child: Container(
              width: 330,
              height: 60,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: unlockedColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Text(
                'Сложение и вычитание десятичных дробей',
                style: TextStyle(fontSize: 16),
                softWrap: true,
                maxLines: 2,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (globals.score >= 6) {
                globals.test2 = 0;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Test2FirstPage()),
                );
              }
            },
            child: Container(
              width: 330,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: globals.score >= 35 ? unlockedColor : lockedColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Text(
                'Умножение и деление десятичной дроби на 10, 100, 1000, ...',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Container(
            width: 330,
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              'Умножение десятичных дробей',
              style: TextStyle(fontSize: 16),
              softWrap: true,
              maxLines: 2,
            ),
          ),
          Container(
            width: 330,
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              'Округление десятичных дробей',
              style: TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
          Container(
            width: 330,
            height: 60,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey[400],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Text(
              'Проверочная работа',
              style: TextStyle(fontSize: 16),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
