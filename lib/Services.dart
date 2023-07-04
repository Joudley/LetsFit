import 'dart:convert';
import 'package:flutter/services.dart';

// class Services{
//   Static Future<List<Exercise>> loadExercices async {
//     String jsonstring = await rootBundle.loadString('assets/fichimaj.json');
//     List<dynamic> jsonList = jsonDecode(jsonstring);
//     return jsonList.map((json) => Exercice.fromJson(json)).toList();
// }

Future<String> loadJsonData() async {
  return await rootBundle.loadString('assets/myfich.json');
}
