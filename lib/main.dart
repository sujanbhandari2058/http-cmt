import 'package:flutter/material.dart';
import 'package:https_api/page/home.dart';

void main() {
  runApp(const myapp());
}

class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
      title: 'http',
    );
  }
}
