// import 'package:avs/menu.dart';
import 'package:avs/messagerie/tchatRoom.dart';
import 'package:avs/settings/settings.dart';
import 'package:flutter/material.dart';
// import 'home/SelectEnCoursRealiser.dart';
import '../profil/profil.dart';

class appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controllereMail;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(right: 55, top: 10),
                  child: Image.asset(
                    '/Logo.png',
                    height: 50,
                  ),
                )
              ]),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          // child: SelectEnCoursRealiser(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/fond.png'), fit: BoxFit.fill),
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
