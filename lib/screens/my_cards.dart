import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nucard/components/my_card.dart';
import 'package:nucard/screens/form_cadastration.dart';

class MyCards extends StatefulWidget {
  final List<MyCard> _listOfMyCards = List();

  @override
  State<StatefulWidget> createState() {
    return MyCardsState();
  }
}

class MyCardsState extends State<MyCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      body: ListView.builder(
          itemCount: widget._listOfMyCards.length,
          itemBuilder: (context, indice) {
            final myCardIndice = widget._listOfMyCards[indice];
            return myCardIndice;
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future<MyCard> future =
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormCardCadastration();
          }));
          future.then((myCardReturned) {
            if (myCardReturned != null) {
              setState(() {
                widget._listOfMyCards.add(myCardReturned);
              });
            }
          });
        },
      ),
    );
  }
}