import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryshelda/Login.dart';
import 'package:deliveryshelda/Model/Copos.dart';
import 'package:deliveryshelda/Telas/Produtos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _email = "";
  String _nome = "";

  Future _dadosUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    FirebaseUser usuarioLogado = await auth.currentUser();

    Firestore db = Firestore.instance;
    DocumentSnapshot snapshot =
        await db.collection("Usuarios").document(usuarioLogado.uid).get();

    var dados = snapshot.data;

    setState(() {
      _email = dados['email'];
      _nome = dados['nome'];
    });
  }

  Future _deslogar() async {
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.signOut();

    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  void initState() {
    _dadosUsuarioLogado();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "img/logo.gif",
          width: 75,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_nome),
              accountEmail: Text(_email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://w7.pngwing.com/pngs/997/887/png-transparent-avatar-computer-icons-user-profile-internet-avatar-man.png"),
              ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.mapMarked),
              title: Text(
                "Endereço",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.signOutAlt),
              title: Text(
                "Sair",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              onTap: () {
                _deslogar();
              },
            ),
          ],
        ),
      ),
      body: Produtos(),
    );
  }
}
