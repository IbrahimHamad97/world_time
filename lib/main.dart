import 'package:flutter/material.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/locations.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/locations": (context) => Locations(),
    },
  ));
}
