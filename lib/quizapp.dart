import 'dart:async';
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
  String link =Utilities.currentpath;
  dynamic data;
  int counter = -1, n = -1;
  int _selectedOption = 0;
  int point = 0;
  String b = "_selectedOption";
  String correctanswer = "";
  String length = "length";
  String question = "Press The Start Button To Start The Quiz..";
  String opt1 = "";
  String opt2 = "";
  String opt3 = "";
  String opt4 = "";
  String buttonlevel = "Start";
  int i = 0;
  Color buttoncolorred = Colors.teal;
  int _Counter = 10;
  late Timer _timer;
  bool showrnot = false;
  bool Test_start = false;
  bool Test_over = false;
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

  void startTimer() {
    _Counter = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_Counter > 0) {
        setState(() {
          _Counter--;
        });
      } else {
        setState(() {
          _timer.cancel();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     // Padding(
          //     //   padding: const EdgeInsets.only(top: 20),
          //     //   child: Container(
          //     //     width: 250,
          //     //     height: 50,
          //     //     decoration: const BoxDecoration(
          //     //       gradient: LinearGradient(
          //     //         begin: Alignment.topCenter,
          //     //         end: Alignment.bottomCenter,
          //     //         colors: [
          //     //           Color(0xffb74093),
          //     //           Color(0xff123456),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //     child: Center(
          //     //         child: Text(
          //     //       "Time Remaining: $_Counter",
          //     //       style: const TextStyle(
          //     //           fontSize: 20,
          //     //           fontWeight: FontWeight.bold,
          //     //           color: Colors.white),
          //     //     )),
          //     //   ),
          //     // ),
          //   ],
          // ),

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
          //<<<<<<Visible options before click the start button>>>>>>>>>>>>./
          Visibility(
            visible: showrnot,
            child: Expanded(
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
                          fontSize: 20.0,
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
                            fontSize: 20.0,
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
                          fontSize: 20.0,
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
                            fontSize: 20.0,
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
          ),
          if (Test_start != true)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 2),
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
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        child: Text(buttonlevel),
                        onPressed: () async {
                          //<<<<<<<<<<Timer Fun() calling>>>>>>>>>./
                          startTimer();
                          showrnot = true;
                          Test_start = true;
                          //<<<<<<<<<<Start to submit  button change >>>>>>>>>>>>>>>>//

                          if (counter >= -1) {
                            buttonlevel = "Submit";
                            buttoncolorred = Colors.lightGreen.shade600;
                          }

                          //<<<<<<<<<<Start the test then button text and color is change>>>>>>>>>>>>>>>>//
                          if (counter == -1) {
                            //*******if question start than question is downloaded**********************

                            data = await Utilities.downloadQuestions(link);
                            data = data["questions"];

                            //create the question array length
                            n = data.length;
                            for (int i = 0; i <= n - 1; i++) {
                              question = data[i]["question"];
                              opt1 = data[i]["opta"];
                              opt2 = data[i]["optb"];
                              opt3 = data[i]["optc"];
                              opt4 = data[i]["optd"];
                              correctanswer = data[i]["correctanswer"];
                              questions.add(Question(question, opt1, opt2, opt3,
                                  opt4, correctanswer));
                            }
                            questions.add(Question("", "", "", "", "", ""));
                            print(questions);
                            counter++;
                            currentquestion = questions[counter];
                            question = currentquestion!.question;
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
                          question = currentquestion!.question;
                          correctanswer = currentquestion!.correctanswer;

                          currentquestion = questions[counter];
                          question = currentquestion!.question;
                          opt1 = currentquestion!.opta;
                          opt2 = currentquestion!.optb;
                          opt3 = currentquestion!.optc;
                          opt4 = currentquestion!.optd;
                          correctanswer = currentquestion!.correctanswer;

                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          primary: buttoncolorred,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          //<<<<<<<<<<<<<<<< Submit button >>>>>>>>>>>>>>//
          if (Test_start && Test_over != true)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.green, width: 2),
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
                    child: SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        child: Text(buttonlevel),
                        onPressed: () async {
                          showrnot = true;

                          if (counter == -1) {
                            //*******if question start than question is downloaded**********************

                            data = await Utilities.downloadQuestions(link);
                            data = data["questions"];

                            //create the question array length
                            n = data.length;
                            for (int i = 0; i <= n - 1; i++) {
                              question = data[i]["question"];
                              opt1 = data[i]["opta"];
                              opt2 = data[i]["optb"];
                              opt3 = data[i]["optc"];
                              opt4 = data[i]["optd"];
                              correctanswer = data[i]["correctanswer"];
                              questions.add(Question(question, opt1, opt2, opt3,
                                  opt4, correctanswer));
                            }
                            questions.add(Question("", "", "", "", "", ""));
                            print(questions);
                            counter++;
                            currentquestion = questions[counter];
                            question = currentquestion!.question;
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
                          question = currentquestion!.question;
                          correctanswer = currentquestion!.correctanswer;
//<<<<<<<<<<<<<<<<<<<<<<<<<<Restart condition>>>>>>>>>>>>>>>>>.//
                          if (counter >= n) {
                            setState(() {});
                            _timer.cancel();
                            //startTimer();
                            print("Test over");
                            Center(child: Text("$_Counter"));
                            question = "Test over correct answer=$point";
                            opt1 = "";
                            opt2 = "";
                            opt3 = "";
                            opt4 = "";
                            point = 0;
                            showrnot = false;
                            counter = -1;
                            buttonlevel = "Restart";
                            buttoncolorred = Colors.red;
                            return;
                          } //<<<<<<<<<<<<<<<<<<<<<<<<<<Restart condition end>>>>>>>>>>>>>>>>>.//

                          currentquestion = questions[counter];
                          question = currentquestion!.question;
                          opt1 = currentquestion!.opta;
                          opt2 = currentquestion!.optb;
                          opt3 = currentquestion!.optc;
                          opt4 = currentquestion!.optd;
                          correctanswer = currentquestion!.correctanswer;

                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          primary: buttoncolorred,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          Row(
            children: scores,
          )
        ],
      ),
    );
  }
}

