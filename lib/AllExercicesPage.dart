import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:cached_network_image/cached_network_image.dart';
import 'Model.dart';
import 'ExerciseDetailsPage.dart';

class AllExercicesPage extends StatefulWidget {
  @override
  _AllExercicesPageState createState() => _AllExercicesPageState();
}

class _AllExercicesPageState extends State<AllExercicesPage> {
  List<Exercise> exercises = [];

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  Future<void> fetchExercises() async {
    try {
      String jsonString = await rootBundle.loadString('assets/imaj.json');
      final jsonData = jsonDecode(jsonString);
      final List<dynamic> exercisesJson = jsonData['exercices'];

      setState(() {
        exercises = exercisesJson
            .map((json) => Exercise.fromJson(json))
            .toList();
      });
    } catch (error) {
      print('Error loading exercises: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All exercices'),
      ),
      body:ListView.separated(
        itemCount: exercises.length,
        separatorBuilder: (context, index) => SizedBox(height: 50),
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExerciseDetailsPage(exercise: exercise),
                ),
              );
            },
            child: ListTile(
              title: Text(exercise.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Muscle: ${exercise.muscle}'),
                  Text('Type: ${exercise.type}'),
                  Text('Difficulty: ${exercise.difficulty}'),
                  Image.asset("${exercise.imageUrl}"),
                ],
              ),
            ),
          );
        },
      ),

    );
  }
}
