import 'package:flutter/material.dart';
import 'package:nucard/components/my_card.dart';
import 'package:nucard/database/app_database.dart';
import 'package:nucard/screens/my_cards.dart';

void main() {
  runApp(NuCard());
  save(MyCard('Titi', 'Piranha')).then((id){
    findAll().then((myCards) => debugPrint('sdfasf' + myCards.toString()));
  });
}

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


