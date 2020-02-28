import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  int id;
  String title;
  String description;

  MyCard(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.nfc),
        title: Text(this.title),
        subtitle: Text(this.description),
      ),
    );
  }
}