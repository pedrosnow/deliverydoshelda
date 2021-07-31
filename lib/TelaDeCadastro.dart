import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryshelda/Model/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Telas/Home.dart';

class TelaDeCadastro extends StatefulWidget {
  @override
  _TelaDeCadastroState createState() => _TelaDeCadastroState();
}

class _TelaDeCadastroState extends State<TelaDeCadastro> {
  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerNumero = TextEditingController();
  String _mensagerro = "";

  _validarCampos() {
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    String numero = _controllerNumero.text;

    if (nome.isNotEmpty) {
      if (email.isNotEmpty && email.contains("@")) {
        if (senha.isNotEmpty && senha.length > 6) {
          if (numero.isNotEmpty) {
            Usuario usuario = Usuario();
            usuario.nome = nome;
            usuario.email = email;
            usuario.senha = senha;
            usuario.telefone = numero;

            _cadastrarUsuario(usuario);
          } else {
            setState(() {
              _mensagerro = "Preencha campo numero";
            });
          }
        } else {
          setState(() {
            _mensagerro = "Preencha senha e digite mais que 6 caratere";
          });
        }
      } else {
        setState(() {
          _mensagerro = "Preencha Email usando @";
        });
      }
    } else {
      setState(() {
        _mensagerro = "Preencha o Nome";
      });
    }
  }

  _cadastrarUsuario(Usuario usuarios) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth
        .createUserWithEmailAndPassword(
      email: usuarios.email,
      password: usuarios.senha,
    )
        .then((FirebaseUser) {
      Firestore db = Firestore.instance;
      db
          .collection("Usuarios")
          .document(FirebaseUser.uid)
          .setData(usuarios.toMap());

      print(usuarios.toMap().toString());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }).catchError((erro) {
      print(erro.toString());
      setState(() {
        _mensagerro = "erro ao cadastrar usuario";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              "img/fundo.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 100,
                left: 20,
                right: 20,
              ),
              child: Column(
                children: [
                  Text(
                    "Cadastro",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 50),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _controllerNome,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 13, 32, 13),
                        hintText: "Nome",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _controllerEmail,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15, 13, 32, 13),
                      hintText: "E-mail",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30, top: 30),
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _controllerSenha,
                      obscureText: true,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(15, 13, 32, 13),
                        hintText: "Senha",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller: _controllerNumero,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(15, 13, 32, 13),
                      hintText: "whatsapp",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: RaisedButton(
                      onPressed: () {
                        _validarCampos();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _mensagerro,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jápossui conta? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Loga-se aqui!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
