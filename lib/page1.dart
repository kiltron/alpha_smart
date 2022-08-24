import 'package:flutter/material.dart';
import 'package:alpha_smart/main.dart';
import 'package:alpha_smart/page2.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'globals.dart' as globals;

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool _speechEnabled = false;
  String _lastWords = '';
  bool _isCorrectAnswer = false;
  Color? choosedColor = Colors.greenAccent;
  Color? unchoosedColor = Colors.grey[400];
  bool _isChosen1 = false;
  bool _isChosen2 = false;
  bool _isChosen3 = false;
  bool _isChosen4 = false;
  final FlutterTts flutterTts = FlutterTts();
  String _textSpeech = 'ноль целых шестьдесят пять тысячных';
  speak(String text) async {
    await flutterTts.setLanguage('ru-RU');
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

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
                "1/7",
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
            margin: EdgeInsets.only(top: 50, bottom: 20),
            decoration: BoxDecoration(
              color: Colors.redAccent[100],
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: const Text(
              'Прослушай запись и выбери правильный вариант.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: () => speak(_textSpeech),
              icon: Image.asset(
                'assets/images/speaker.png',
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _isCorrectAnswer = true;
                      setState(() {
                        _isChosen1 = true;
                        _isChosen2 = false;
                        _isChosen3 = false;
                        _isChosen4 = false;
                      });
                    },
                    child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(),
                          color: _isChosen1 ? choosedColor : unchoosedColor,
                        ),
                        child: Text(
                          '0,065',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _isCorrectAnswer = false;
                      setState(() {
                        _isChosen1 = false;
                        _isChosen2 = true;
                        _isChosen3 = false;
                        _isChosen4 = false;
                      });
                    },
                    child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(),
                          color: _isChosen2 ? choosedColor : unchoosedColor,
                        ),
                        child: Text(
                          '0,65',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      _isCorrectAnswer = false;
                      setState(() {
                        _isChosen1 = false;
                        _isChosen2 = false;
                        _isChosen3 = true;
                        _isChosen4 = false;
                      });
                    },
                    child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(),
                          color: _isChosen3 ? choosedColor : unchoosedColor,
                        ),
                        child: Text(
                          '0,165',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _isCorrectAnswer = false;
                      setState(() {
                        _isChosen1 = false;
                        _isChosen2 = false;
                        _isChosen3 = false;
                        _isChosen4 = true;
                      });
                    },
                    child: Container(
                        width: 120,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          border: Border.all(),
                          color: _isChosen4 ? choosedColor : unchoosedColor,
                        ),
                        child: Text(
                          '0,0065',
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                ],
              )),
          GestureDetector(
            onTap: () {
              if (_isCorrectAnswer == true) {
                globals.test1++;
              }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondPage()),
              );
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
                  'Подсказка\nВспомни разряды десятичных дробей! В записи десятичной дроби сколько цифр после запятой пишут до разряда тысячных?',
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
                  width: 140,
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
