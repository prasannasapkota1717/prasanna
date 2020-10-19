import 'package:flutter/material.dart';
import 'quizbrian.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
int x= 0;

QuizBrain quizBrain = QuizBrain();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Quizpage(),
            ),
          )),
    );
  }
}

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List <Icon> scorekeeper = [];
  void checkanswer(bool userchoosenanswer){
      setState(() {
        if (quizBrain.getanswer() == userchoosenanswer){
          x= x+1;
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else{
          scorekeeper.add
            (Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        if( quizBrain.end() == true) {
          Alert(context: context, title: "Your Score : $x", desc: "Thank you for attempting all of our questions.").show();
          quizBrain.reset();
          scorekeeper = [];
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getquestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                'true',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkanswer(true);
                  quizBrain.nextquestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'false',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  checkanswer(false);
                  quizBrain.nextquestion();
                });
              }
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}

//mt everest is in nepal true
//trump is the president of the usa true
// buddha was born in india false