import 'package:flutter/material.dart';
import 'questionslist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  QuestionsList quest = new QuestionsList();

  

  int index = 0;
  int score = 0;

  void result() {
    setState(() {
      score += 10;
    });
  }

  List<String> questions = [
    "Are you Programmer ?",
    "Do you like to work on .net framework?",
    "Do you like to work on .Net framework ?",
    "Are you a techie person ?"
  ];

  void next() {
    setState(() {
      index++;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Quiz App",
              
            ),
            centerTitle: true,
            backgroundColor: Colors.lightBlue[400],
          ),
          backgroundColor: Colors.blue[100],
          body: index < quest.questionslists.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          quest.questionslists[index].question,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      padding: const EdgeInsets.all(18.0),
                      width: double.maxFinite,
                      child: FlatButton(
                        child: Text("True"),
                        onPressed: () {
                          
                          if (quest.questionslists[index].ans == true) {
                            
                            result();
                          }
                          next();
                        },
                        color: Colors.green,
                      ),
                    )),
                    Expanded(
                        child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(18.0),
                      child: FlatButton(
                        child: Text("False"),
                        onPressed: () {
                          
                          if (quest.questionslists[index].ans == false) {
                            
                            result();
                          }
                          next();
                        },
                        color: Colors.teal,
                      ),
                    )),
                    
                  ],
                )
              : Column(mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Container(
                      child: Text(
                    "Quiz Score: $score",
                    textAlign: TextAlign.center,
                  )),
                  FlatButton(onPressed: (){
                    setState((){
                      index=0;
                      score=0;
                    });
                  }, child: Text("Reset"))
                ])),
    );
  }
}