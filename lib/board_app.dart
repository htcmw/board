import 'package:flutter/material.dart';

import 'layout.dart';

class BoardApp extends StatelessWidget {
  const BoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Insight',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BulletinBoardPage(),
    );
  }
}
