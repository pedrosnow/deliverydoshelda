import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryshelda/Model/Copos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sobrimesas extends StatefulWidget {
  Copos copos;

  Sobrimesas(this.copos);

  @override
  _SobrimesasState createState() => _SobrimesasState();
}

class _SobrimesasState extends State<Sobrimesas> {
  _dadosServidor() async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot =
        await db.collection("complementos").getDocuments();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;
      print(dados.toString());
    }
  }

  @override
  void initState() {
    _dadosServidor();
    super.initState();
  }

  _complementos() {
    Navigator.pushNamed(context, "/complementos");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complementos"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20, left: 10, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    child: Text(
                      "Complementos Disponivel",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {
                      _complementos();
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: new BoxDecoration(
                color: Colors.deepPurple[400],
                borderRadius: BorderRadius.circular(10),
              ),
              padding:
                  EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            RaisedButton(
              color: Colors.deepPurple[400],
              onPressed: () {},
              child: Text(
                "Adicionar Complementos",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
