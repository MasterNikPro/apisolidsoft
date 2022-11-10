import 'package:apisolidsoft/screens/picture_screen.dart';
import 'package:flutter/material.dart';

import 'screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) =>  const ListScreen(),
        '/full_picture_screen': (context) => const FullPictureScreen(url:""),
      },
    );
  }
}
