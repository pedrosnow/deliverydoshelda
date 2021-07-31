import 'package:flutter/material.dart';

class Complementos extends StatefulWidget {
  @override
  _ComplementosState createState() => _ComplementosState();
}

class _ComplementosState extends State<Complementos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complementos Disponiveis"),
      ),
      body: SingleChildScrollView(),
    );
  }
}
