import 'package:flutter/material.dart';

import 'classes.dart';
import 'downloder.dart';
//<<<<<<<<<<<<<<<<<<<<Python language quiz>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>./
class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  List<Question> questions = [];
  Question? currentquestion; // create the question variable
  String link =
      "shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/6097508e7368d3930e23fe33001c576e4176de8a/array.json";
  dynamic data;
  int counter = -1, n = -1;
  int _selectedOption = 0;
  int point = 0;
  String b = "_selectedOption";
  String correctanswer = "";
  String message = "Clicked";
  String length = "length";
  String question = "Press the button to start the Quiz";
  String opt1 = "";
  String opt2 = "";
  String opt3 = "";
  String opt4 = "";
  int i = 0;
  List<Widget> scores = [];
  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  void addResult(_selectedOption) {
    int correcctanswerint =
    int.parse(correctanswer); // convert string to integer
    bool isanswercorrect = _selectedOption == correcctanswerint;
    //scores.clear();
    if (isanswercorrect) {
      point++;
      scores.add(Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  question,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 3.0,
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                  RadioListTile(
                    title: Text(
                      opt1,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    value: 1,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(opt2,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    value: 2,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(
                      opt3,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                    value: 3,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                  RadioListTile(
                    title: Text(opt4,
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        )),
                    value: 4,
                    groupValue: _selectedOption,
                    onChanged: _handleOptionChange,
                  ),
                ],
              ),
            ),
          ),

          //**************Pressed the button****************************************
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                      Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 10,
                          spreadRadius: 1.0,
                        ),
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(-2.0, -2.0),
                          blurRadius: 10,
                          spreadRadius: 1.0,
                        ),
                      ]),
                  child: ElevatedButton(
                      child: Text("click me $counter"),
                      onPressed: () async {
                        print("counter$counter");
                        if (counter == -1) {

                          //*******if question start than question is downloaded**********************

                          data = await Utilities.downloadQuestions(link);
                          data = data["questions"];

                          //create the question array length
                          n = data.length;
                          for (int i = 0; i <= n-1; i++) {
                            question = data[i]["question"];
                            opt1 = data[i]["opta"];
                            opt2 = data[i]["optb"];
                            opt3 = data[i]["optc"];
                            opt4 = data[i]["optd"];
                            correctanswer = data[i]["correctanswer"];
                            questions.add(Question(
                                question, opt1, opt2, opt3, opt4, correctanswer));
                          }
                          questions.add(Question("", "", "", "", "", ""));
                          print(questions);
                          counter++;
                          currentquestion = questions[counter];
                          question=currentquestion!.question;
                          opt1 = currentquestion!.opta;
                          opt2 = currentquestion!.optb;
                          opt3 = currentquestion!.optc;
                          opt4 = currentquestion!.optd;
                          correctanswer = currentquestion!.correctanswer;
                          setState(() {});
                          return;
                        }
                        addResult(_selectedOption);
                        counter++;
                        currentquestion = questions[counter];
                        question =currentquestion!.question;
                        correctanswer = currentquestion!.correctanswer;

                        if (counter >= n) {
                          setState(() {});
                          // addResult(_selectedOption);
                          print("Test over");
                          question = "Test over correct answer=$point";
                          opt1 = "";
                          opt2 = "";
                          opt3 = "";
                          opt4 = "";
                          message = "Restart";
                          return;
                        }

                        currentquestion = questions[counter];
                        question=currentquestion!.question;
                        opt1 = currentquestion!.opta;
                        opt2 = currentquestion!.optb;
                        opt3 = currentquestion!.optc;
                        opt4 = currentquestion!.optc;
                        correctanswer = currentquestion!.correctanswer;

                        setState(() {});
                      },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.lightGreen[700],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                ),
              ),
            ],
          ),
          //<<<<<<<<<<<<Icon Row>>>>>>>>>>>>>>>>>>//
          Row(
            children: scores,
          )
        ],
      ),
    );
  }
}



//<<<<<<<<<<<<<<<<<<<<C language quiz>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>./


class CQuizApp extends StatefulWidget {
  const CQuizApp({Key? key}) : super(key: key);

  @override
  State<CQuizApp> createState() => _CQuizAppState();
}


class _CQuizAppState extends State<CQuizApp> {
  List<Question> questions = [];
  Question? currentquestion; // create the question variable
  String link =
      "/shubhamgitvns/89d337387aaf2d1f2f134a51fd327078/raw/ed7169b258f5e4cdb1d94d4a6628bf47d03d8bb7/c.json";
  dynamic data;
  int counter = -1, n = -1;
  int _selectedOption = 0;
  int point = 0;
  String b = "_selectedOption";
  String correctanswer = "";
  String message = "Clicked";
  String length = "length";
  String question = "Press the button to start the Quiz";
  String opt1 = "";
  String opt2 = "";
  String opt3 = "";
  String opt4 = "";
  int i = 0;
  List<Widget> scores = [];
  void _handleOptionChange(int? value) {
    setState(() {
      _selectedOption = value!;
    });
  }

  void addResult(_selectedOption) {
    int correcctanswerint =
    int.parse(correctanswer); // convert string to integer
    bool isanswercorrect = _selectedOption == correcctanswerint;
    //scores.clear();
    if (isanswercorrect) {
      point++;
      scores.add(Icon(Icons.check, color: Colors.green));
    } else {
      scores.add(Icon(Icons.close, color: Colors.red));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                question,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Center(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3.0,
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                RadioListTile(
                  title: Text(
                    opt1,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  value: 1,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(opt2,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      )),
                  value: 2,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(
                    opt3,
                    style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    ),
                  ),
                  value: 3,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
                RadioListTile(
                  title: Text(opt4,
                      style: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      )),
                  value: 4,
                  groupValue: _selectedOption,
                  onChanged: _handleOptionChange,
                ),
              ],
            ),
          ),
        ),

        //**************Pressed the button****************************************
        ElevatedButton(
            child: Text("click me $counter"),
            onPressed: () async {
              print("counter$counter");
              if (counter == -1) {

                //*******if question start than question is downloaded**********************

                data = await Utilities.downloadQuestions(link);
                data = data["questions"];

                //create the question array length
                n = data.length;
                for (int i = 0; i <= n-1; i++) {
                  question = data[i]["question"];
                  opt1 = data[i]["opta"];
                  opt2 = data[i]["optb"];
                  opt3 = data[i]["optc"];
                  opt4 = data[i]["optd"];
                  correctanswer = data[i]["correctanswer"];
                  questions.add(Question(
                      question, opt1, opt2, opt3, opt4, correctanswer));
                }
                questions.add(Question("", "", "", "", "", ""));
                print(questions);
                counter++;
                currentquestion = questions[counter];
                question=currentquestion!.question;
                opt1 = currentquestion!.opta;
                opt2 = currentquestion!.optb;
                opt3 = currentquestion!.optc;
                opt4 = currentquestion!.optd;
                correctanswer = currentquestion!.correctanswer;
                setState(() {});
                return;
              }
              addResult(_selectedOption);
              counter++;
              currentquestion = questions[counter];
              question =currentquestion!.question;
              correctanswer = currentquestion!.correctanswer;

              if (counter >= n) {
                setState(() {});
                // addResult(_selectedOption);
                print("Test over");
                question = "Test over correct answer=$point";
                opt1 = "";
                opt2 = "";
                opt3 = "";
                opt4 = "";
                message = "Restart";
                return;
              }

              currentquestion = questions[counter];
              question=currentquestion!.question;
              opt1 = currentquestion!.opta;
              opt2 = currentquestion!.optb;
              opt3 = currentquestion!.optc;
              opt4 = currentquestion!.optc;
              correctanswer = currentquestion!.correctanswer;

              setState(() {});
            }),
        Row(
          children: scores,
        )
      ],
    );
  }
}