import 'package:flutter/material.dart';
import 'package:quizz_app/screens/quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.48,
              padding: EdgeInsets.fromLTRB(0, 70, 0, 0),

              // color: Colors.blue,
              width: double.maxFinite,
              child: Image.asset(
                'assets/images/hero.png',
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'QUIZ SAGA',
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 19, 95, 156),
                      ),
                    ),
                    Wrap(children: const [
                      Text(
                          'Yo! take a quiz to find out your personality. Win exclusive prizes & get a chance to win a trip to the moon!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 19, 95, 156))),
                    ]),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizScreen(),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 19, 95, 156),
                          radius: 40,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
