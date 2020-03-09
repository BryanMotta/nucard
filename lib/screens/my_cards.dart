import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nucard/components/my_card.dart';
import 'package:nucard/database/app_database.dart';
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
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          final List<MyCard> myCardsFound = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
              final MyCard myCardIndex = myCardsFound[index];
              return myCardIndex;

            },
              itemCount: myCardsFound.length,
          );
        },
      ),
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