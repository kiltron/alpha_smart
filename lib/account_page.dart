import 'package:alpha_smart/rating_page.dart';
import 'package:alpha_smart/win_page.dart';
import 'package:alpha_smart/fail_page.dart';
import 'package:alpha_smart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'globals.dart' as globals;

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlphaSMART',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 252, 220, 37),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              child: Text(
                'Мой профиль',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.fromLTRB(0, 20, 20, 5),
                    child: Image.asset(
                      'assets/images/account_icon.png',
                      scale: 2,
                    )),
                Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(255, 252, 220, 37),
                  child: Text(
                    "Винокурова Азалия",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Количество очков: ${globals.score}',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RatingPage()),
                );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Рейтинг в классе ${globals.rating}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RatingPage()),
                );
              },
              child: Container(
                width: 330,
                height: 60,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 220, 37),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Text(
                  'Рейтинг класса',
                  style: TextStyle(fontSize: 16),
                ),
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
                  'В главное',
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
