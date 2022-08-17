import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController _pageController = PageController();

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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Questions 7",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 19, 95, 156))),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text("/25",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromARGB(
                                                  255, 19, 95, 156))),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/score.png',
                                      width: 22,
                                    ),
                                    Text(" 5",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 19, 95, 156))),
                                  ],
                                ),
                              )
                            ],
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
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
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromARGB(255, 184, 222, 253)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                            child: (Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("What makes men die younger than women?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 19, 95, 156))),
                                Container(
                                  // color: Colors.yellow,
                                  height:
                                      MediaQuery.of(context).size.height * 0.32,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      //options of the question
                                      InkWell(
                                        child: Container(
                                          // height: 50,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              "Smoking",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 19, 95, 156)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          // height: 50,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              "Drugs & Alcohol",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 19, 95, 156)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          // height: 50,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              "Masturbation",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 19, 95, 156)),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          // height: 50,
                                          width: double.maxFinite,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Text(
                                              "All of the above",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 19, 95, 156)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                          ),
                        ),
                      ),

                      //button to go to next question
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //page navigator buttons
                            InkWell(
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
