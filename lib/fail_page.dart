import 'package:alpha_smart/page7.dart';
import 'package:alpha_smart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'globals.dart' as globals;

class FailPage extends StatefulWidget {
  const FailPage({Key? key}) : super(key: key);

  @override
  State<FailPage> createState() => _FailPageState();
}

class _FailPageState extends State<FailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphaSMART',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 252, 220, 37),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 150),
              width: 400,
              child: Image.asset(
                'assets/images/fail.png',
              ),
            ),
            Container(
              child: Text(
                '${globals.test1}/7',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: Text(
                'Попробуй еще раз',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                '-1 очко',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red),
              ),
            ),
            Flexible(child: Container()),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHome()),
                );
              },
              child: Container(
                width: 330,
                height: 60,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  'Вернуться назад',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
