import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nucard/components/form.dart';
import 'package:nucard/components/my_card.dart';

class FormCardCadastration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormCardCadastrationState();
  }
}

class FormCardCadastrationState extends State<FormCardCadastration> {
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de cartão.'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Fomr(_controllerTitle, 'Titulo', 'Cartão do trabalho.'),
            Fomr(_controllerDescription, 'Descrição', '4° andar, Squad 19'),
            RaisedButton(
              child: Text('Cadastrar'),
              onPressed: () => _createCard(context),
            ),
          ],
        ),
      ),
    );
  }
  void _createCard(BuildContext context) {
    if (_controllerTitle.text != null && _controllerDescription.text != null) {
      final myCardToReturn =
      MyCard(_controllerTitle.text, _controllerDescription.text);
      Navigator.pop(context, myCardToReturn);
    }
  }
}
