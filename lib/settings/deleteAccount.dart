// ignore_for_file: prefer_const_constructors
import 'dart:core';
// import 'package:avs/menu.dart';
import 'package:avs/messagerie/tchatRoom.dart';
import 'package:avs/settings/settings.dart';
import 'package:avs/resetPassword.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../profil/profil.dart';

class DeleteAccount extends StatefulWidget {
  late String mail;
  DeleteAccount({required this.mail});
  @override
  _DeleteAccountState createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  Future getData() async {
    var response = await http.get(Uri.parse('http://localhost:3001/read.php'));
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
          backgroundColor: Colors.transparent,
          title: Text(''),
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
            child: Form(
                child: ListView(children: <Widget>[
              Center(
                  child: Container(
                      width: 200,
                      child: Text(
                        'Suppression de compte',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.white,
                        ),
                      ))),
              Center(
                  child: Container(
                      margin: const EdgeInsets.only(
                          top: 80.0, left: 40.0, right: 40.0), //
                      child: Text(
                        'Pour quelle(s) raison(s) souhaitez-vous supprimer votre compte ?',
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ))),
              Container(
                  // height: 100,

                  margin: const EdgeInsets.only(
                      top: 50.0, left: 40.0, right: 40.0), //
                  child: TextFormField(
                    style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500, color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 14.0, bottom: 8.0, top: 8.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange),
                        borderRadius: BorderRadius.circular(15.7),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15.7),
                      ),
                    ),
                    cursorColor: Colors.black,
                    minLines:
                        3, // any number you need (It works as the rows for the textarea)
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  )),
              Container(
                height: 40,
                margin: const EdgeInsets.only(
                    top: 100.0,
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
                    FutureBuilder<dynamic>(
                      future: getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  List list = snapshot.data;
                                  return ListTile(
                                    leading: GestureDetector(
                                      child: Icon(Icons.edit),
                                      // onTap: (){
                                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(list: list,index: index,),),);
                                      // debugPrint('Edit Clicked');
                                      // },
                                    ),
                                    trailing: GestureDetector(
                                      child: Icon(Icons.delete),
                                      onTap: () {
                                        setState(() {
                                          http.post(
                                              Uri.parse(
                                                  'http://localhost:3001/delete.php'),
                                              body: {
                                                'idUser': list[index]['idUser'],
                                              });
                                        });
                                        debugPrint('delete Clicked');
                                      },
                                    ),
                                  );
                                })
                            : CircularProgressIndicator();
                      },
                    ),
                  },
                  child: Text(
                    'SUPPRIMER',
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
                    const EdgeInsets.only(top: 30.0, left: 90.0, right: 90.0),
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
                            builder: (context) =>
                                Settings(mail: controllereMail),
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
            ]))),
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
