import 'package:avs/test/delete.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AddEditPage extends StatefulWidget {
  final  list;
  final index;
  AddEditPage({this.list,this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController pseudo = TextEditingController();
  TextEditingController dateDeNaissance = TextEditingController();
  TextEditingController eMail = TextEditingController();
  TextEditingController motDePasse = TextEditingController();

  bool editMode = false;


  addUpdateData(){
    if(editMode){
    
      http.post(Uri.parse('http://localhost:3001/edit.php'),body: {
        'idUser' : widget.list[widget.index]['idUser'],
        'nom' : nom.text,
        'prenom' : prenom.text,
        'pseudo' : pseudo.text,
        'dateDeNaissance' : dateDeNaissance.text,
        'eMail' : eMail.text,
        'motDePasse' : motDePasse.text,
      });
    }else{

      http.post(Uri.parse('http://localhost:3001/add.php'),body: {
        'nom' : nom.text,
        'prenom' : prenom.text,
        'pseudo' : pseudo.text,
        'dateDeNaissance' : dateDeNaissance.text,
        'eMail' : eMail.text,
        'motDePasse' : motDePasse.text,
      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      nom.text = widget.list[widget.index]['nom'];
      prenom.text = widget.list[widget.index]['prenom'];
      pseudo.text = widget.list[widget.index]['pseudo'];
      dateDeNaissance.text = widget.list[widget.index]['dateDeNaissance'];
      eMail.text = widget.list[widget.index]['eMail'];
      motDePasse.text = widget.list[widget.index]['motDePasse'];
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(editMode ? 'Update' :'Add Data'),),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nom,
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: prenom,
              decoration: InputDecoration(
                labelText: 'Prénom')
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pseudo,
              decoration: InputDecoration(
                labelText: 'Pseudo',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dateDeNaissance,
              decoration: InputDecoration(
                labelText: 'Date de Naissance',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: eMail,
              decoration: InputDecoration(
                labelText: 'eMail',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: motDePasse,
              decoration: InputDecoration(
                labelText: 'Mot de Passe',
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  addUpdateData();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(mail: ""),),);
                debugPrint('Clicked RaisedButton Button');
              },
            
              child: Text(editMode ? 'Update' :'Save',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
