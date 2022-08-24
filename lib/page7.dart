import 'package:flutter/material.dart';
import 'package:alpha_smart/page6.dart';
import 'package:alpha_smart/win_page.dart';
import 'package:alpha_smart/fail_page.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'globals.dart' as globals;

class SeventhPage extends StatefulWidget {
  const SeventhPage({Key? key}) : super(key: key);

  @override
  State<SeventhPage> createState() => _SeventhPageState();
}

class _SeventhPageState extends State<SeventhPage> {
  TextEditingController textEditingController = TextEditingController();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  Widget build(BuildContext context) {
    final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();

    return MaterialApp(
      title: 'AlphaSMART',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 252, 220, 37),
          leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: Image.asset(
              'assets/images/arrow_left_circle.png',
              scale: 0.8,
            ),
          ),
          actions: [
            Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              child: Text(
                "7/7",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ],
        ),
        body: Column(children: <Widget>[
          Container(
            width: 300,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            margin: EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: const Text(
              'Вычисли 2,82 + 2/5 и запиши ответ в виде десятичной дроби.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            width: 300,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
              children: [
                Text('Введите ваш ответ:'),
                TextFormField(controller: textEditingController),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              if (textEditingController.text == '3.22' ||
                  textEditingController.text == '3,22') {
                globals.test1++;
              }
              if (globals.test1 >= 4) {
                globals.score += 6;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const WinPage()));
              } else {
                globals.score -= 1;
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FailPage()));
              }
            },
            child: Container(
              padding: EdgeInsets.only(right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Далее  ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Image.asset(
                    'assets/images/arrow_right_circle_fill.png',
                    scale: 0.8,
                  )
                ],
              ),
            ),
          ),
          Flexible(child: Container()),
          Container(
            child: Tooltip(
              key: tooltipkey,
              triggerMode: TooltipTriggerMode.manual,
              showDuration: const Duration(seconds: 10),
              message:
                  'Подсказка\nЧтобы сложить обыкновенную дробь и десятичную, их нужно привести к одному и тому же виду.',
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 252, 220, 37),
                  border: Border.all()),
              textStyle: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (() {
                  tooltipkey.currentState?.ensureTooltipVisible();
                }),
                child: Container(
                  width: 180,
                  height: 60,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  margin: EdgeInsets.only(bottom: 50, left: 40),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Color.fromARGB(255, 252, 220, 37),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Text(
                    'Подсказка',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    softWrap: true,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
