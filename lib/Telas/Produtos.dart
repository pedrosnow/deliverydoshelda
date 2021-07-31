import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryshelda/Model/Copos.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Produtos extends StatefulWidget {
  @override
  _ProdutosState createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  Future<List<Copos>> _recuperarProdutos() async {
    Firestore db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection("copos").getDocuments();

    List<Copos> listCopos = List();
    for (DocumentSnapshot item in querySnapshot.documents) {
      var dados = item.data;

      Copos copos = Copos();
      copos.id = dados["id"];
      copos.preco = dados["preco"];
      copos.tamanho = dados["tamanho"];
      copos.url = dados["url"];

      listCopos.add(copos);
    }
    return listCopos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Copos>>(
      future: _recuperarProdutos(),
      // ignore: missing_return
      builder: (contex, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            return Container(
              padding: EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: .59,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) {
                  List<Copos> listaItem = snapshot.data;
                  Copos copos = listaItem[index];
                  return Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.purple[50],
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          FadeInImage.assetNetwork(
                            placeholder: "img/load.gif",
                            image: copos.url,
                            width: 100,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 5),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    "Copo " + copos.tamanho,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 8),
                                child: Text(
                                  "R\$: " + copos.preco,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          RaisedButton(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            color: Colors.deepPurple[400],
                            onPressed: () {
                              Navigator.pushNamed(context, "/Sobrimesas",
                                  arguments: copos);
                            },
                            child: Text(
                              "Pedir",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
            break;
        }
      },
    );
  }
}
