import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class TchatRoom extends StatefulWidget {
  late String mail;
  TchatRoom({required this.mail});

  @override
  State<TchatRoom> createState() => _TchatRoomState();
}

class _TchatRoomState extends State<TchatRoom> {
  Future getData() async {
    var url = 'http://localhost:3001/read.php';
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
            title: Text('Messages')),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/fond.png'), fit: BoxFit.cover)),
            child: Column(children: [
              Expanded(
                child: Container(
                  margin:
                      EdgeInsets.only(left: 20, top: 80, right: 20, bottom: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                child: Row(children: [
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(children: [
                            Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type your message ...',
                                  hintStyle: TextStyle(color: Colors.grey[500]),
                                ),
                              ),
                            ),
                            // Icon(
                            //   Icons.send_outlined,
                            //   color: Colors.grey[500],
                            // )
                          ]))),
                  SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ]),
              ),
            ])));
  }
}
