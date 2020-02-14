import 'package:flutter/material.dart';

void main() => runApp(NuCard());

class NuCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NuCard',
      theme: ThemeData.light(),
      home: FormCardCadastration(),
    );
  }
}

class MyCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cards'),
      ),
      body: Column(
        children: <Widget>[
          MyCard('Studio', '4° andar, Squad 19'),
        ],
      ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerTitle,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Titulo',
                hintText: 'Cartão do trabalho',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerDescription,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                labelText: 'Descrição',
                hintText: '4° andar, Squad 19',
              ),
            ),
          ),
          RaisedButton(
            child: Text('Cadastrar'),
            onPressed: () {
              MyCard(_controllerTitle.text, _controllerDescription.text);
            },
          ),
        ],
      ),
    );
  }
}
