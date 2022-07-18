// ignore: file_names
import 'package:avs/login.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:date_time_picker/date_time_picker.dart';
// class SignUp extends StatelessWidget {
//   const SignUp({Key? key}) : super(key: key);

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  // final List list;
  // final int index;
  // SignUp({this.list,this.index});
  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController pseudo = TextEditingController();
  TextEditingController dateDeNaissance = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController motDePasse = TextEditingController();

  // bool editMode = false;

  addData() {
    // var url = 'http://localhost:3001/add.php';

    http.post(Uri.parse('http://localhost:3001/add.php'), body: {
      'nom': nom.text,
      'prenom': prenom.text,
      'pseudo': pseudo.text,
      'dateDeNaissance': dateDeNaissance.text,
      'eMail': eMail.text,
      'motDePasse': motDePasse.text,
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   if(widget.index != null){
  //     // editMode = true;
  //     nom.text = widget.list[widget.index]['nom'];
  //     prenom.text = widget.list[widget.index]['prenom'];
  //     pseudo.text = widget.list[widget.index]['pseudo'];
  //     dateDeNaissance.text = widget.list[widget.index]['dateDeNaissance'];
  //     email.text = widget.list[widget.index]['email'];
  //     motDePasse.text = widget.list[widget.index]['motDePasse'];
  //   }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                // key: _formKey,
                child: ListView(children: <Widget>[
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(
                          top: 80.0, left: 75.0, right: 75.0),
                      child: Text(
                        "S'\INSCRIRE",
                        style: GoogleFonts.raleway(
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                            color: Colors.white),
                      ))),
              Container(
                margin:
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    controller: nom,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
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
                margin:
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    controller: prenom,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Prénom',
                      labelStyle: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    controller: pseudo,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Pseudo',
                      labelStyle: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                  margin:
                      const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                  // child: TextFormField(
                  //     controller: dateDeNaissance,
                  //     style: GoogleFonts.raleway(
                  //         fontWeight: FontWeight.w400, color: Colors.white),
                  //     keyboardType: TextInputType.datetime,
                  //     cursorColor: Colors.white,
                  //     decoration: const InputDecoration(
                  //       enabledBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //       ),
                  //       focusedBorder: UnderlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //       ),
                  //       labelText: 'Date de Naissance',
                  //       labelStyle: TextStyle(color: Colors.white),
                  //     )),
                  child: TextFormField(
                    controller: dateDeNaissance,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: "Date de Naissance",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () async {
                      DateTime? date = DateTime(1900);
                      FocusScope.of(context).requestFocus(new FocusNode());

                      date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));

                      dateDeNaissance.text = date!.toIso8601String();
                    },
                  )),
              Container(
                margin:
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    controller: eMail,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'eMail',
                      labelStyle: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    controller: motDePasse,
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Mot de Passe',
                      labelStyle: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 20.0, left: 90.0, right: 90.0),
                child: TextFormField(
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w400, color: Colors.white),
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.white,
                    obscureText: true,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelText: 'Confirmer Mot de Passe',
                      labelStyle: TextStyle(color: Colors.white),
                    )),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                    top: 50.0,
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
                    addData(),
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
            ]))));
  }
}
