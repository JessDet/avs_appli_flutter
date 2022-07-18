import 'package:avs/test/delete.dart';
import 'package:avs/settings/deleteAccount.dart';
import 'package:avs/settings/settings.dart';
import 'package:avs/login.dart';
// import 'package:avs/welcome_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'AVS',
       
      theme: ThemeData(
        // Define the default brightness and colors.
        // primarySwatch: Colors.deepOrange,
       
    
        // Define the default font family.
        fontFamily: 'Acme',),
      debugShowCheckedModeBanner: false,
      home: MyLogin(),
    );
  }
}
