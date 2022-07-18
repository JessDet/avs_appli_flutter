import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// This widget is the root of your application.

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
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
    return Scaffold(
      body: FutureBuilder<dynamic>(
        future: getData(),
        builder: (context, snapshot) {
          // ignore: avoid_print
         
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                  List? list = snapshot.data as List?;
                  return ListTile(
                
                    title: Text(list![index]['nom'],),
                    subtitle: Text(list[index]['eMail']),
                  );
                })
              : const CircularProgressIndicator();
        },
      ),
    );
  }
}
