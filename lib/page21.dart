import 'package:flutter/material.dart';
import 'package:alpha_smart/main.dart';
import 'package:alpha_smart/page22.dart';
import 'globals.dart' as globals;

class Test2FirstPage extends StatefulWidget {
  const Test2FirstPage({Key? key}) : super(key: key);

  @override
  State<Test2FirstPage> createState() => _Test2FirstPageState();
}

class _Test2FirstPageState extends State<Test2FirstPage> {
  bool _isCorrectAnswer = false;
  Color? choosedColor = Colors.greenAccent;
  Color? unchoosedColor = Colors.grey[400];
  bool _isChosen1 = false;
  bool _isChosen2 = false;

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
          body: Column(
            children: <Widget>[
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
                  'Чтобы умножить десятичную дробь на 10, 100, 1000 и т.д., в какую сторону нужно перенести запятую в этой дроби?',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
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
                          _isCorrectAnswer = false;
                          setState(() {
                            _isChosen1 = true;
                            _isChosen2 = false;
                          });
                        },
                        child: Container(
                            width: 120,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(),
                              color: _isChosen1 ? choosedColor : unchoosedColor,
                            ),
                            child: Text(
                              'Влево',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          _isCorrectAnswer = true;
                          setState(() {
                            _isChosen1 = false;
                            _isChosen2 = true;
                          });
                        },
                        child: Container(
                            width: 120,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
                              border: Border.all(),
                              color: _isChosen2 ? choosedColor : unchoosedColor,
                            ),
                            child: Text(
                              'Вправо',
                              style: TextStyle(fontSize: 20),
                            )),
                      ),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  if (_isCorrectAnswer == true) {
                    globals.test2++;
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Test2SecondPage()),
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
                      'Подсказка\nВспомни правило умножения десятичной дроби на степень 10.',
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            ],
          )),
    );
  }
}
