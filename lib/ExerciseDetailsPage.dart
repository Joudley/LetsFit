import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'Model.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final Exercise exercise;

  ExerciseDetailsPage({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercise.name),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 300.0, 16.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Type: ${exercise.type}'),
                  Text('Muscle: ${exercise.muscle}'),
                  Text('Difficulty: ${exercise.difficulty}'),
                  Text('equipment: ${exercise.equipment}'),
                  Text('Instructions: ${exercise.instructions}'),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 300.0,
              color: Colors.white,
              child: Image.asset(
                "${exercise.imageUrl}",
              ),
            ),
          ),
        ],
      ),
    );
  }

}
