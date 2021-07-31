import 'package:deliveryshelda/Splash.dart';
import 'package:deliveryshelda/TelaDeCadastro.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'Telas/Complementos.dart';
import 'Telas/Home.dart';
import 'Telas/Sobrimesas.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => Splash(),
        );
      case "/login":
        return MaterialPageRoute(
          builder: (_) => Login(),
        );
      case "/cadastro":
        return MaterialPageRoute(
          builder: (_) => TelaDeCadastro(),
        );
      case "/home":
        return MaterialPageRoute(
          builder: (_) => Home(),
        );
      case "/Sobrimesas":
        return MaterialPageRoute(
          builder: (_) => Sobrimesas(args),
        );
      case "/complementos":
        return MaterialPageRoute(
          builder: (_) => Complementos(),
        );
      default:
        _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada!"),
        ),
        body: Center(
          child: Text("Tela não encontrada!"),
        ),
      );
    });
  }
}
