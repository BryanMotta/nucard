import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  String _title;
  String _description;

  MyCard(this._title, this._description);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.nfc),
        title: Text(this._title),
        subtitle: Text(this._description),
      ),
    );
  }
}