import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, this.final_score}) : super(key: key);
  final final_score;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 80, 16, 0),
            child: Center(
              child: Image.asset(
                'assets/images/result.png',
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              'CONGRATS!',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 19, 95, 156),
              ),
            ),
          ),
          Text("You scored $final_score points",
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 19, 95, 156))),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return QuizScreen();
                  }),
                );
              },
              //restart button
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 19, 95, 156),
                radius: 40,
                child: Icon(
                  Icons.arrow_circle_down,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
