// import 'package:avs/menu.dart';
import 'package:avs/messagerie/homeTchat.dart';
import 'package:avs/messagerie/tchatRoom.dart';
import 'package:flutter/material.dart';
import '../profil/modif_profil_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../settings/settings.dart';
// import 'package:flutter_session/flutter_session.dart';

class Profil extends StatefulWidget {
  late String mail;
  Profil({required this.mail});

  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
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
          title: Text('Profil'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/fond.png'),
                    fit: BoxFit.cover)),
            child: Container(
                margin: EdgeInsets.only(top: 100),
                child: FutureBuilder<dynamic>(
                    future: getData(),
                    builder: (context, snapshot) {
                      print((snapshot));
                      return snapshot.hasData
                          ? ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                List? list = snapshot.data as List?;
                                return Container(
                                  alignment: Alignment.center,
                                  child: Column(children: [
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
                                                backgroundImage: NetworkImage(
                                                  list![index]['image'],
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Container(
                                      child: Text(list[index]['pseudo'],
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.white,
                                        ),
                                        Text(list[index]['ville'],
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    )),
                                    Container(
                                        padding: EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.cake,
                                              color: Colors.white,
                                            ),
                                            Text(list[index]['dateDeNaissance'],
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        )),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Container(
                                      width: 250,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  '25  ',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Archives  ',
                                                  style: TextStyle(
                                                      color: Color(0xffee6523)),
                                                ),
                                                Icon(
                                                    Icons
                                                        .arrow_circle_right_outlined,
                                                    color: Colors.white)
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  '12  ',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                Text(
                                                  'Amis  ',
                                                  style: TextStyle(
                                                      color: Color(0xffee6523)),
                                                ),
                                                Icon(
                                                    Icons
                                                        .arrow_circle_right_outlined,
                                                    color: Colors.white)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '35  ',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          Text(
                                            'Souhaits  ',
                                            style: TextStyle(
                                                color: Color(0xffee6523)),
                                          ),
                                          Icon(
                                              Icons.arrow_circle_right_outlined,
                                              color: Colors.white)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 200,
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor: Color(0xffee6523),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      onPressed: () {
                                        var controllereMail;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ModifProfilPage(
                                                    mail: controllereMail),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            'Modifier le profil',
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                  ]),
                                );
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    }))),
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
                  onPressed: () {
                    var controllereMail;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => HomeTchat(mail: controllereMail),
                        builder: (context) => TchatRoom(mail: controllereMail),
                      ),
                    );
                  },
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
