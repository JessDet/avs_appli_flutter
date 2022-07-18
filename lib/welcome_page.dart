import 'dart:async';
import 'package:flutter/material.dart';
import 'delayed_animation.dart';
import 'package:avs/login.dart';


void main() {
  scheduleTimeout(5 * 1000); // 5 seconds.
}

Timer scheduleTimeout([int milliseconds = 10000]) =>
    Timer(Duration(milliseconds: milliseconds), handleTimeout);

void handleTimeout() {
  MaterialPageRoute(builder:(context) => MyLogin(),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: WelcomePage());
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
            left:
                BorderSide(width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
            right:
                BorderSide(width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
            bottom:
                BorderSide(width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
          ),
          image: DecorationImage(
            image: NetworkImage('assets/fond.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: DelayedAnimation(
            delay: 1500,
            child: Container(
              alignment: Alignment.center,
              // height: 500,
              child: Image.asset(
                '/Logo.png',
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_outlined),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyLogin(),
            ),
          );
        },
      ),
    );
  }
}
