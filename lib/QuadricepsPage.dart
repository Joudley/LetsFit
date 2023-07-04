import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'Model.dart';
import 'ExerciseDetailsPage.dart';


class QuadricepsPage extends StatefulWidget {
  @override
  _QuadricepsPageState createState() => _QuadricepsPageState();
}

class _QuadricepsPageState extends State<QuadricepsPage> {
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
            .where((exercise) => exercise.muscle == 'quadriceps')
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
        title: Text('Quadriceps exercices'),
      ),
      body: ListView.separated(
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