import 'package:deliveryshelda/RouteGenerator.dart';
import 'package:flutter/material.dart';
import 'Splash.dart';
import 'RouteGenerator.dart';

void main() {
  runApp(
    MaterialApp(
      home: Splash(),
      theme: ThemeData(
        primaryColor: Color(0xff4a0055),
        shadowColor: Color(0xff4a0055),
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    ),
  );
}
