import 'package:flutter/material.dart';

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

class MyCards extends StatefulWidget {
  final List<MyCard> _listOfMyCards = List();



  @override
  State<StatefulWidget> createState() {
    return MyCardsState();
  }
}

class MyCardsState extends State<MyCards>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      body: ListView.builder(
          itemCount: widget._listOfMyCards.length ,
          itemBuilder: (context, indice) {
            final myCardIndice = widget._listOfMyCards[indice];
            return myCardIndice;
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Future<MyCard> future = Navigator.push(
              context, MaterialPageRoute(builder: (context) {
            return FormCardCadastration();
          }));
          future.then((myCardReturned) {
            widget._listOfMyCards.add(myCardReturned);
          });
        },),
    );
  }

}

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

class FormCardCadastration extends StatelessWidget {

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de cartão.'),
      ),
      body: Column(
        children: <Widget>[
          Fomr(_controllerTitle, 'Titulo', 'Cartão do trabalho.'),
          Fomr(_controllerDescription, 'Descrição', '4° andar, Squad 19'),

          RaisedButton(
            child: Text('Cadastrar'),
            onPressed: () => _createCard(context),
          ),
        ],
      ),
    );
  }

  void _createCard(BuildContext context) {
    if (_controllerTitle.text != null &&
        _controllerDescription.text != null) {
      final myCardToReturn = MyCard(_controllerTitle.text, _controllerDescription.text);
      Navigator.pop(context, myCardToReturn);
    }
  }
}


class Fomr extends StatelessWidget {
  final TextEditingController _controller;
  final String _titulo;
  final String _descricao;
  final IconData icon;

  Fomr(this._controller, this._titulo, this._descricao, { this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: _titulo,
          hintText: _descricao,
        ),
      ),
    );
  }
}


