import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  int id;
  final String title;
  final String description;

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

  @override
  String toString() {
    return 'MyCard{id: $id, title: $title, description: $description}';
  }


}