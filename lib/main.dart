import 'package:flutter/material.dart';

import 'package:flutter_instegram/screens/mainScreern.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              textStyle: TextStyle(
                  fontFamily: 'GB', fontSize: 16, fontWeight: FontWeight.w700)),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage("images/prf.png"),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Center(
                  child: Image(image: AssetImage('images/logo_splash.png'))),
            ),
            Positioned(
              bottom: 40,
              child: Column(
                children: [
                  Text(
                    'ftom',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 191, 208, 216)),
                  ),
                  Text(
                    'flutter',
                    style: TextStyle(color: Color.fromARGB(255, 7, 147, 211)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
