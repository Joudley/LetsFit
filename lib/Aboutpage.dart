import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Let\'s Fit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Let\'s Fit is an offline fitness application that offers a variety of fitness exercises and routines. Whether you\'re a beginner or an advanced fitness enthusiast, Let\'s Fit provides a wide range of workout options to help you stay active and reach your fitness goals. \n\n With Let\'s Fit, you can access a collection of exercise gif and detailed instructions, ensuring that you perform each exercise correctly and safely. The app covers various workout categories such as cardio, strength training, flexibility, and more. You can customize your workout sessions based on your preferences, time availability, and fitness level. \n\nWhether you prefer to exercise at home, in the park, or at the gym, Let\'s Fit is designed to be your ultimate fitness companion. It empowers you to take control of your health and make positive lifestyle changes.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
