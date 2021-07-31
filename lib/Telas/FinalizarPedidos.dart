import 'package:flutter/material.dart';

class FinalizarPedidos extends StatefulWidget {
  @override
  _FinalizarPedidosState createState() => _FinalizarPedidosState();
}

class _FinalizarPedidosState extends State<FinalizarPedidos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Finalizar Pedidos"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.deepPurple[100],
              child: Container(
                padding: EdgeInsets.all(7),
                child: Column(
                  children: [
                    Text(
                      "Copo",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "200 ML  |  Qtd: 2",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Column(
                        children: [
                          Text(
                            "Recheios",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Creme de Orio",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Amendoind",
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Bombom",
                              style: TextStyle(fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Text(
                            "Endereço",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Av. Luiz da costa veloso"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Pedra de Luz"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("141"),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text("Casa vermelha"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RaisedButton(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  onPressed: () {},
                  color: Colors.deepPurpleAccent,
                  child: Text(
                    "Pedir",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
