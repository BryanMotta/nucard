import 'package:flutter/material.dart';
import 'package:nucard/screens/my_cards.dart';

void main() => runApp(NuCard());

class NuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuCard',
      theme: ThemeData.light(),
      home: MyCards(),
    );
  }
}


