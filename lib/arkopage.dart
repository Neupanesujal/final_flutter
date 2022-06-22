import 'package:flutter/material.dart';
import 'package:y/main.dart';

class arkopage extends StatefulWidget {
  @override
  State<arkopage> createState() => _arkopageState();
}

class _arkopageState extends State<arkopage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(child: Text(mytxt)),
            Container(
              child: Text(mytxt1),
            )
          ],
        ),
      ),
    );
  }
}
