import 'package:flutter/material.dart';
import 'package:quizz_app/data/quiz_data.dart';
import 'package:quizz_app/screens/api_demo.dart';
import 'package:quizz_app/screens/result_screen.dart';
import 'package:quizz_app/widgets/quiz_option_box.dart';

import 'new_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentPageNo = 1;
  int totalScore = 0;
  PageController _pageController = PageController();

  bool isAnswered = false;
  int tappedIndex = 0;

  void ifAnswered(String option, String answer) {
    setState(() {
      isAnswered = true;
    });
    if (option == answer) {
      totalScore++;
    }

    nextQuiz();

    if (currentPageNo == qnaData.length) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => ResultScreen(
                      final_score: totalScore,
                    )));
      });
    } else {
      nextQuiz();
    }
  }

  Color getCorrectColor(int qIndex, String optionKey, int tappedIndex) {
    if (isAnswered == true) {
      if (qnaData[qIndex][optionKey] == qnaData[qIndex]['answer']) {
        return Colors.green;
      } else if (qnaData[qIndex]['option${tappedIndex + 1}'] ==
              qnaData[qIndex][optionKey] &&
          qnaData[qIndex][optionKey] != qnaData[qIndex]['answer']) {
        return Colors.red;
      }
    }

    return Colors.white;
  }

  getPercentage(int number, int total) {
    double result = ((number / total) * 100) / 100;
    return result;
  }

  void nextQuiz() {
    Future.delayed(Duration(seconds: 2), () {
      _pageController.nextPage(
          duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
      setState(() {
        isAnswered = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (
        //scaffold of quiz screen
        Scaffold(
            body: Padding(
                padding: const EdgeInsets.fromLTRB(20, 64, 20, 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 64),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Question $currentPageNo",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 19, 95, 156))),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text("/${qnaData.length}",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 19, 95, 156))),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ApiDemo()));
                                      },
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            Color.fromARGB(255, 19, 95, 156),
                                        child: (Icon(Icons.star,
                                            color: Color.fromARGB(
                                                255, 221, 255, 96),
                                            size: 16)),
                                      ),
                                    ),
                                    Text(" ${totalScore.toString()}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 19, 95, 156))),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 8,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                255, 184, 222, 253)),
                                      ),
                                      Container(
                                        height: 8,
                                        width: (MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                34) *
                                            getPercentage(
                                                currentPageNo, qnaData.length),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color.fromARGB(
                                                255, 19, 95, 156)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 64),
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.52,
                            width: double.maxFinite,
                            child: PageView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              onPageChanged: (int pageNo) {
                                setState(() {
                                  currentPageNo = pageNo + 1;
                                });
                              },
                              itemCount: qnaData.length,
                              controller: _pageController,
                              itemBuilder: (context, index) => Container(
                                height: double.maxFinite,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(255, 184, 222, 253)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 24, 16, 24),
                                  child: (Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(qnaData[index]['question'],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 19, 95, 156))),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.32,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            //options of the question
                                            QuizOptionBox(
                                              option: qnaData[index]["option1"],
                                              bgColor: getCorrectColor(index,
                                                  'option1', tappedIndex),
                                              onPressed: isAnswered
                                                  ? () {}
                                                  : () {
                                                      ifAnswered(
                                                          qnaData[index]
                                                              ['option1'],
                                                          qnaData[index]
                                                              ['answer']);
                                                      setState(() {
                                                        tappedIndex = 0;
                                                      });
                                                    },
                                            ),
                                            QuizOptionBox(
                                              bgColor: getCorrectColor(index,
                                                  'option2', tappedIndex),
                                              option: qnaData[index]["option2"],
                                              onPressed: isAnswered
                                                  ? () {}
                                                  : () {
                                                      ifAnswered(
                                                          qnaData[index]
                                                              ['option2'],
                                                          qnaData[index]
                                                              ['answer']);
                                                      setState(() {
                                                        tappedIndex = 1;
                                                      });
                                                    },
                                            ),
                                            QuizOptionBox(
                                              option: qnaData[index]["option3"],
                                              bgColor: getCorrectColor(index,
                                                  'option3', tappedIndex),
                                              onPressed: isAnswered
                                                  ? () {}
                                                  : () {
                                                      ifAnswered(
                                                          qnaData[index]
                                                              ['option3'],
                                                          qnaData[index]
                                                              ['answer']);
                                                      setState(() {
                                                        tappedIndex = 2;
                                                      });
                                                    },
                                            ),
                                            QuizOptionBox(
                                              option: qnaData[index]["option4"],
                                              bgColor: getCorrectColor(index,
                                                  'option4', tappedIndex),
                                              onPressed: isAnswered
                                                  ? () {}
                                                  : () {
                                                      ifAnswered(
                                                          qnaData[index]
                                                              ['option4'],
                                                          qnaData[index]
                                                              ['answer']);
                                                      setState(() {
                                                        tappedIndex = 3;
                                                      });
                                                    },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                            )),
                      ),
                      //button to go to next question
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //page navigator buttons
                            InkWell(
                              onTap: () {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease);
                              },
                              child: (CircleAvatar(
                                radius: 32,
                                backgroundColor:
                                    Color.fromARGB(255, 19, 95, 156),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: InkWell(
                                onTap: () {
                                  _pageController.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.easeIn);
                                },
                                child: (CircleAvatar(
                                  radius: 32,
                                  backgroundColor:
                                      Color.fromARGB(255, 19, 95, 156),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            )
                          ]),
                    ]))));
  }
}
