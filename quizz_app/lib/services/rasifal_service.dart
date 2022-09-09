import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/rasifal_model.dart';

class RasifalService {
  static String baseUrl = "https://hamropatrorashifal.herokuapp.com/";

  static Future<List<Rasifal>> getRasifal() async {
    var response = await http.get(Uri.parse(baseUrl));

    //decoding api data
    var data = json.decode(Utf8Decoder().convert(response.bodyBytes));

    List<Rasifal> rasifalList = [];
    for (var rasifal in data) {
      Rasifal newRasifal = Rasifal(
          title: rasifal['title'],
          description: rasifal['description'],
          image: rasifal['image']);
      rasifalList.add(newRasifal);
    }
    return rasifalList;
  }
}
