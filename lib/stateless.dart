import 'package:flutter/material.dart';
import 'package:quiz_app/quizapp.dart';

class QuizOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        //App bar one *******************************************
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        title: const Text(
          'Quiz App',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const [
              SizedBox(
                height: 150,
              ),
              Expanded(
                  child: Center(
                child: Text(
                  "Select Yor Choice",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.teal),
                ),
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 100),
                child: Card(
                  child: ElevatedButton(
                      child: const Text('Python Quiz'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      }),
                ),
              ),
              Card(
                child: ElevatedButton(
                    child: const Text('C.Quiz'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/Third');
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//*************python Quiz Appp*****************************

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Python Quiz"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: const QuizApp(),
      ),
    ));
  }
}

//*******************C Quiz App**********************************

class QuizThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("C.Quiz"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: const CQuizApp(),
      ),
    ));
  }
}
