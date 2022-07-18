// ignore_for_file: prefer_const_constructors
import 'dart:core';
import 'package:avs/AppBar.dart';
import 'package:avs/messagerie/tchatRoom.dart';
// import 'package:avs/menu.dart';
import 'package:avs/profil/modif_profil_page.dart';
import 'package:avs/settings/changePassword.dart';
import 'package:avs/settings/deleteAccount.dart';
import 'package:avs/resetPassword.dart';
import 'package:avs/settings/termsOfUse.dart';
import 'package:avs/test/test.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../profil/profil.dart';

class Settings extends StatefulWidget {
  late String mail;
  Settings({required this.mail});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Future getData() async {
    var url = 'http://localhost:3001/read_profil.php';
    // var url = 'https://alexis-demeyer.fr/read.php';
    var response = await http.post(url, body: {"eMail": widget.mail});
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controllereMail;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Paramètres'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
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
              ),
            ),
            child: ListView(padding: EdgeInsets.zero, children: <Widget>[
              SizedBox(
                height: 150,
              ),
              TextButton(
                  onPressed: () {
                    var controllereMail;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ModifProfilPage(mail: controllereMail),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(40),
                    child: Row(
                      children: [
                        Icon(
                          // Icons.edit_note,
                          Icons.face,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Modification de profil',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffee6523),
                            fontSize: 16,
                          ),
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
                          builder: (context) =>
                              ChangePassword(mail: controllereMail),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(40),
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Modification de mot de passe',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffee6523),
                            fontSize: 16,
                          ),
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
                          builder: (context) =>
                              DeleteAccount(mail: controllereMail),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
                    padding: EdgeInsets.all(40),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_forever,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Suppression de compte',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffee6523),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TermsOfUse(mail: controllereMail),
                        ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20),
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
                          'Conditions d\'utilisation',
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            color: Color(0xffee6523),
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ))
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
        ));
  }
}
