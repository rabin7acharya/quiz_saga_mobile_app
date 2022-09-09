import 'package:flutter/material.dart';
import 'package:quizz_app/models/rasifal_model.dart';

import '../services/rasifal_service.dart';

class ApiDemo extends StatelessWidget {
  const ApiDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RasifalService.getRasifal();
    return Scaffold(
        appBar: AppBar(title: Text("Ambo!")),
        body: FutureBuilder<List<Rasifal>>(
          future: RasifalService.getRasifal(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var rasifalList = snapshot.data;
              return (ListView.builder(
                  itemCount: rasifalList!.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: double.maxFinite,
                      child: Row(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: 100,
                            child: Image(
                                image: NetworkImage(
                                    rasifalList[index].image.toString())),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.28,
                            width: 300,
                            child: Column(children: [
                              Flexible(
                                  child: Text(
                                      rasifalList[index].title.toString())),
                              Flexible(
                                  child: Text(rasifalList[index]
                                      .description
                                      .toString()))
                            ]),
                          )
                        ],
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Opps! something went wrong, Please try again!',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 235, 35, 35),
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ));
  }
}
