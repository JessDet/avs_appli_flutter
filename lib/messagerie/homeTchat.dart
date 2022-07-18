import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class HomeTchat extends StatefulWidget {
  late String mail;
  HomeTchat({required this.mail});

  @override
  State<HomeTchat> createState() => _HomeTchatState();
}

class _HomeTchatState extends State<HomeTchat> {
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
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 100,
            centerTitle: false,
            title: Text('Messagerie')),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/fond.png'), fit: BoxFit.cover)),
          child: Column(
            children: [
              FutureBuilder<dynamic>(
                  future: getData(),
                  builder: (context, snapshot) {
                    print((snapshot));
                    return snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              List? list = snapshot.data as List?;
                              return Container(
                                  margin: const EdgeInsets.only(top: 20),
                                  child: Row(children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundImage: NetworkImage(
                                        list![index]['image'],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ]));
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          );
                  })
            ],
          ),
        ));
  }
}
