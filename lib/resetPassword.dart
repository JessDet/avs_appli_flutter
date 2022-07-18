import 'package:avs/login.dart';
import 'package:avs/register.dart';
import 'package:flutter/material.dart';
import 'package:avs/welcome_page.dart';
import 'package:avs/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController controllernom = new TextEditingController();
  TextEditingController controllerprenom = new TextEditingController();
  TextEditingController controllereMail = new TextEditingController();

  // get http => null;

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
                            top: 80.0, left: 40, right: 40),
                        
                        child: Text(
                          'MOT DE PASSE OUBLIE',
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 38,
                              color: Colors.white),
                        ))),
                Container(
                  margin:
                      const EdgeInsets.only(top: 80.0, left: 90.0, right: 90.0),
                  child: TextFormField(
                      controller: controllernom,
                      style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w400, color: Colors.white),
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.white,

                      // Use email input type for emails.
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: 'Nom',
                        labelStyle: TextStyle(color: Colors.white),
                      )),
                ),
                Container(
                    margin: const EdgeInsets.only(
                        top: 50.0, left: 90.0, right: 90.0),
                    child: TextFormField(
                        controller: controllerprenom,
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
                          labelText: 'Prénom',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
                Container(
                    margin: const EdgeInsets.only(
                        top: 50.0, left: 90.0, right: 90.0),
                    child: TextFormField(
                        controller: controllereMail,
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w400, color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        obscureText: true, // Use secure text for passwords.

                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          labelText: 'eMail',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ))),
          Container(
                height: 40,
                margin: const EdgeInsets.only(
                    top: 130.0,
                    left: 90.0,
                    right: 90.0), // width: screenSize.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side:
                                  const BorderSide(color: Colors.deepOrange)))),
                  onPressed: () => {
                   
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyLogin(),
                          ),
                        )
                      },
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
              Container(
                margin:
                    const EdgeInsets.only(top: 5.0, left: 90.0, right: 90.0),
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
                            builder: (context) => MyLogin(),
                          ),
                        );
                      },
                      child: Text(
                        "ANNULER",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
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
}
