import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/services.dart';
import 'BackPage.dart';
import 'AbdominalsPage.dart';
import 'AbductorsPage.dart';
import 'ShoulderPage.dart';
import 'BicepsPage.dart';
import 'CalvesPage.dart';
import 'ChestPage.dart';
import 'ForearmsPage.dart';
import 'GlutesPage.dart';
import 'HamstringsPage.dart';
import 'LatsPage.dart';
import 'NeckPage.dart';
import 'QuadricepsPage.dart';
import 'TrapsPage.dart';
import 'TricepsPage.dart';
import 'CardioPage.dart';
import 'AllExercicesPage.dart';
import 'Aboutpage.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let\'s Fit',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          color: Colors.greenAccent,
        ),
      ),
      home: HomePage(),
      routes: {
        '/abdominals': (context) => AbdominalsPage(),
        '/abductors': (context) => AbductorsPage(),
        '/biceps': (context) => BicepPage(),
        '/calves': (context) => CalvesPage(),
        '/chest': (context) => ChestPage(),
        '/forearms': (context) => ForearmsPage(),
        '/glutes': (context) => GlutesPage(),
        '/hamstrings': (context) => HamstringsPage(),
        '/lats': (context) => LatsPage(),
        '/back': (context) => BackPage(),
        '/shoulder': (context) => ShoulderPage(),
        '/neck': (context) => NeckPage(),
        '/quadriceps': (context) => QuadricepsPage(),
        '/traps': (context) => TrapsPage(),
        '/triceps': (context) => TricepsPage(),
        '/cardio': (context) => CardioPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/forearms.jpg',
    'assets/chest.jpg',
    'assets/triceps.jpg',
    'assets/biceps.jpg',
    'assets/glutes.jpg',
    'assets/quadriceps.jpg',
    'assets/shoulder.jpg',
    'assets/calves.jpg',
    'assets/abdominals.jpg',
    'assets/hamstrings.jpg',
    'assets/back.jpg',
    'assets/neck.jpg',
    'assets/cardio.jpg',
    'assets/abductors.jpg',
    'assets/traps.jpg',
    'assets/lats.jpg',
  ];

  final List<String> pageRoutes = [
    '/forearms',
    '/chest',
    '/triceps',
    '/biceps',
    '/glutes',
    '/quadriceps',
    '/shoulder',
    '/calves',
    '/abdominals',
    '/hamstrings',
    '/back',
    '/neck',
    '/cardio',
    '/abductors',
    '/traps',
    '/lats'

  ];

   @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.greenAccent,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Let's Fit"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.greenAccent,
        child: Column(
          children: [
            Container(
              height: 190,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/annfit.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('All exercices'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllExercicesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About Let\'s Fit'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share Let\'s Fit'),
              onTap: () {
                Share.share("Checkout this app at https://joudley.online");
              },
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(imagePaths.length, (index) {
          final imagePath = imagePaths[index];
          final exerciseName =
          imagePath.split('/').last.split('.').first.capitalize();
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, pageRoutes[index]);
            },
            child: Container(
              margin: EdgeInsets.all(3),
              child: SizedBox(
                height: 100,
                width: 200,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(

                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text(
                          exerciseName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
