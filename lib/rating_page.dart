import 'package:alpha_smart/account_page.dart';
import 'package:alpha_smart/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'globals.dart' as globals;

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  List<String> rating_names = [
    "Винокурова Азалия",
    "Жезарова Ира",
    "Ноговицын Сережа",
    "Сахатаева Алина",
    "Михайлова Диана",
    "Винокуров Тимофей",
    "Тайшин Саша",
    "Петрова Ира",
    "Супсукова Даяна"
  ];
  List<String> rating_scores = [
    '30',
    '20',
    '18',
    '15',
    '11',
    '11',
    '10',
    '5',
    '2'
  ];

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
                'Рейтинг класса',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: Row(
                children: [
                  Column(children: [
                    Text('  ', style: TextStyle(fontSize: 25)),
                    Text('1.', style: TextStyle(fontSize: 25)),
                    Text('2.', style: TextStyle(fontSize: 25)),
                    Text('3.', style: TextStyle(fontSize: 25)),
                    Text('4.', style: TextStyle(fontSize: 25)),
                    Text('5.', style: TextStyle(fontSize: 25)),
                    Text('6.', style: TextStyle(fontSize: 25)),
                    Text('7.', style: TextStyle(fontSize: 25)),
                    Text('8.', style: TextStyle(fontSize: 25)),
                    Text('9.', style: TextStyle(fontSize: 25)),
                  ]),
                  Column(children: [
                    Text('Имя',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text(rating_names[0], style: TextStyle(fontSize: 25)),
                    Text(rating_names[1], style: TextStyle(fontSize: 25)),
                    Text(rating_names[2], style: TextStyle(fontSize: 25)),
                    Text(rating_names[3], style: TextStyle(fontSize: 25)),
                    Text(rating_names[4], style: TextStyle(fontSize: 25)),
                    Text(rating_names[5], style: TextStyle(fontSize: 25)),
                    Text(rating_names[6], style: TextStyle(fontSize: 25)),
                    Text(rating_names[7], style: TextStyle(fontSize: 25)),
                    Text(rating_names[8], style: TextStyle(fontSize: 25)),
                  ]),
                  Column(children: [
                    Text('Очки',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                    Text(rating_scores[0], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[1], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[2], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[3], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[4], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[5], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[6], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[7], style: TextStyle(fontSize: 25)),
                    Text(rating_scores[8], style: TextStyle(fontSize: 25)),
                  ]),
                ],
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


// Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               alignment: Alignment.center,
//               child: Text(
//                 'Рейтинг класса',
//                 style: TextStyle(fontSize: 25),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text("Имя",
//                     style:
//                         TextStyle(fontSize: 25)),
//                 Text("Очки",
//                     style:
//                         TextStyle(fontSize: 25)),
//               ],
//             ),
//             Container(
//               height: 10,
//             ),
//             Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('1.',
//                       style:
//                           TextStyle(fontSize: 25)),
//                   Text(rating_names[0]),
//                   Text(rating_scores[0]),
//                 ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('2.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[1]),
//               Text(rating_scores[1]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('3.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[2]),
//               Text(rating_scores[2]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('4.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[3]),
//               Text(rating_scores[3]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('5.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[4]),
//               Text(rating_scores[4]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('6.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[5]),
//               Text(rating_scores[5]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('7.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[6]),
//               Text(rating_scores[6]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('8.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[7]),
//               Text(rating_scores[7]),
//             ]),
//             Row(mainAxisAlignment: MainAxisAlignment.start, children: [
//               Text('9.',
//                   style: TextStyle(fontSize: 25)),
//               Text(rating_names[8]),
//               Text(rating_scores[8]),
//             ]),