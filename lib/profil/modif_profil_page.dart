import 'package:avs/messagerie/tchatRoom.dart';
import 'package:avs/profil/profil.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../profil/profil.dart';
import 'package:flutter/material.dart';
// import '../profil/widgets/modif_img_profil.dart';
// import '../profil/widgets/modif_form_profil.dart';
// import '../menu.dart';

import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:avs/settings/settings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ModifProfilPage extends StatefulWidget {
  late String mail;
  ModifProfilPage({required this.mail});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  ModifProfilPageState createState() {
    return ModifProfilPageState();
  }
}

class ModifProfilPageState extends State<ModifProfilPage> {
  final _formKey = GlobalKey<FormState>();
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

  Widget build(BuildContext context) {
    var controllereMail;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text('Modification Profil'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fond.png'), fit: BoxFit.cover)),
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffee6523),
                        radius: 57,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 55,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/imgProfil/img5.jpg'),
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        padding: EdgeInsetsDirectional.all(80),
                        // alignment: Alignment.topRight,
                        child: Column(
                          children: [
                            Icon(
                              Icons.edit_note_outlined,
                              // color: Color(0xffee6523),
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(60),
                      child: Column(children: <Widget>[
                        FormBuilder(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                // name: ' ',
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffee6523),
                                decoration: const InputDecoration(
                                  labelText: 'Pseudo',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              TextField(
                                // name: ' ',
                                keyboardType: TextInputType.text,
                                cursorColor: Color(0xffee6523),
                                decoration: const InputDecoration(
                                  labelText: 'Ville',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              TextField(
                                // name: ' ',
                                keyboardType: TextInputType.number,
                                cursorColor: Color(0xffee6523),
                                decoration: const InputDecoration(
                                  labelText: 'Date de Naissance',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              TextField(
                                // name: '',
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Color(0xffee6523),
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              Column(
                                children: <Widget>[
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Color(0xffee6523),
                                    ),
                                    child: const Text(
                                      "Valider",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      _formKey.currentState!.save();
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      side:
                                          BorderSide(color: Color(0xffee6523)),
                                    ),
                                    child: const Text(
                                      "Annuler",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      var controllereMail;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              Profil(mail: controllereMail),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),
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
                  onPressed: () {Navigator.push(
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
