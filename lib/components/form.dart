import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Fomr extends StatelessWidget {
  final TextEditingController _controller;
  final String _titulo;
  final String _descricao;
  final IconData icon;

  Fomr(this._controller, this._titulo, this._descricao, {this.icon});

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
