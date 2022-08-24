import 'package:alpha_smart/page27.dart';
import 'package:alpha_smart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'globals.dart' as globals;

class WinPage2 extends StatefulWidget {
  const WinPage2({Key? key}) : super(key: key);

  @override
  State<WinPage2> createState() => _WinPage2State();
}

class _WinPage2State extends State<WinPage2> {
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
                'assets/images/win.png',
              ),
            ),
            Container(
              child: Text(
                '${globals.test2}/7',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              child: Text(
                'Молодец!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              child: Text(
                '+6 очков',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.green),
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
