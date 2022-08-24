import 'package:flutter/material.dart';
import 'package:alpha_smart/page1.dart';
import 'package:alpha_smart/page3.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'globals.dart' as globals;

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';
  String micIcon = 'assets/images/mic.png';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
    });
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
                "2/7",
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
              'Прочти данную десятичную дробь: 10,03',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              'Текст аудиозаписи:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(15),
            child: Text(_speechToText.isListening ? '$_lastWords' : ''),
          )),
          GestureDetector(
            onTap: () {
              if (_lastWords == 'десять целых три сотых' ||
                  _lastWords == '10,03') {
                globals.test1++;
              }

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ThirdPage()),
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
                  'Подсказка\nВспомни разряды десятичных дробей! В записи данной десятичной дроби как будет называться последний разряд?',
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
        floatingActionButton: FloatingActionButton(
          onPressed:
              _speechToText.isNotListening ? _startListening : _stopListening,
          tooltip: 'Запись',
          child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
        ),
      ),
    );
  }
}
