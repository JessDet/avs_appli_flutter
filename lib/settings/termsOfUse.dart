// ignore_for_file: prefer_const_constructors
import 'dart:core';
// import 'package:avs/menu.dart';
import 'package:avs/messagerie/tchatRoom.dart';
import 'package:avs/settings/settings.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../profil/profil.dart';

class TermsOfUse extends StatelessWidget {
  late String mail;
  TermsOfUse({required this.mail});

  @override
  Widget build(BuildContext context) {
    var controllereMail;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Conditions d\'utilisation'),
        elevation: 0,
      ),
      body: Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
                left: BorderSide(
                    width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
                right: BorderSide(
                    width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(238, 101, 35, 0)),
              ),
              image: DecorationImage(
                image: NetworkImage('assets/fond.png'),
                fit: BoxFit.cover,
              )),
          child: ListView(children: <Widget>[
            Center(
                child: Container(
                    margin:
                        const EdgeInsets.only(top: 80.0, left: 40, right: 40),
                    child: Text(
                      'Loremllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll',
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                    ))),
          ])),
      drawer: Drawer(
      backgroundColor: Color(0xff371331),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profil(mail: controllereMail),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Accueil',
                      style: TextStyle(color: Color(0xffee6523)),
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () {
                var controllereMail;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profil(mail: controllereMail),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Profil',
                      style: TextStyle(color: Color(0xffee6523)),
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () { var controllereMail;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TchatRoom(mail: controllereMail),
                      ),
                    );},
              child: Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Messagerie',
                      style: TextStyle(color: Color(0xffee6523)),
                    )
                  ],
                ),
              )),
          TextButton(
              onPressed: () {
                var controllereMail;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(mail: controllereMail),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(40),
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Paramètres',
                      style: TextStyle(color: Color(0xffee6523)),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 70,
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              padding: EdgeInsets.all(40),
              child: Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Deconnexion',
                    style: TextStyle(color: Color(0xffee6523)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}
