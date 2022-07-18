// ignore_for_file: use_build_context_synchronously

import 'package:avs/AppBar.dart';
import 'package:avs/profil/profil.dart';
import 'package:avs/test/delete.dart';
import 'package:avs/settings/settings.dart';
import 'package:avs/register.dart';
import 'package:avs/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:avs/welcome_page.dart';
import 'package:avs/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
// import 'package:flutter_session/flutter_session.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  TextEditingController controllermotDePasse = new TextEditingController();
  TextEditingController controllereMail = new TextEditingController();

  // get http => null;

  void addData() async {
    var response =
        await http.post(Uri.parse('http://localhost:3001/login.php'), body: {
      "eMail": controllereMail.text.trim(),
      "motDePasse": controllermotDePasse.text.trim(),
    });
    var jsonData = jsonDecode(response.body);
    var jsonString = jsonData['message'];
    if (jsonString == 'success') {
      // await FlutterSession().set('token', controllereMail.text.trim(), );

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>

                  /// A stateful widget that is used to display the profile of the user.
                  Profil(mail: controllereMail.text.trim())));
      // context, MaterialPageRoute(builder: (context) => AppBar(mail: controllereMail.text.trim())));
    } else {
      myToast(jsonString);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // appBar: new AppBar(
      //   title: new Text('Login'),
      // ),
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
            ),
          ),
          child: Form(
            child: ListView(
              children: <Widget>[
                Center(
                    child: Container(
                        margin: const EdgeInsets.only(
                            top: 80.0, left: 75.0, right: 75.0),
                        child: Text(
                          'CONNEXION',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                              color: Colors.white),
                        ))),
                Container(
                  margin:
                      const EdgeInsets.only(top: 80.0, left: 90.0, right: 90.0),
                  child: TextFormField(
                      controller: controllereMail,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400, color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,

                      // Use email input type for emails.
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Adresse E-mail',
                        labelStyle: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 50.0, left: 90.0, right: 90.0),
                    child: TextFormField(
                        controller: controllermotDePasse,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400, color: Colors.white),
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.white,
                        obscureText: true, // Use secure text for passwords.

                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'Mot de Passe',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
                Center(
                    child: Container(
                        // width: double.infinity,
                        margin: const EdgeInsets.only(top: 50, left: 150),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPassword(),
                              ),
                            );
                          },
                          child: Text(
                            "Mot de passe oublié ?",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ))),
                Container(
                  height: 40,
                  margin: const EdgeInsets.only(
                      top: 70.0,
                      left: 90.0,
                      right: 90.0), // width: screenSize.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    side: const BorderSide(
                                        color: Colors.deepOrange)))),
                    onPressed: () => addData(),
                    child: Text(
                      'VALIDER',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 100.0),
                    child: Text('Pas encore membre ?',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(top: 20.0, left: 90.0, right: 90.0),
                  child: Container(
                      // width: double.infinity,
                      height: 40,
                      margin: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          side: const BorderSide(color: Colors.red, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        },
                        child: Text(
                          "S'\INSCRIRE",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          )),
    );
  }

  myToast(toast) {
    Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        backgroundColor: Colors.transparent);
  }
}
