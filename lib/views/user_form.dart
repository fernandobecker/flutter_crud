import 'package:flutter/material.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                bool isValid = _form.currentState.validate();

                if (isValid) {
                  _form.currentState.save();
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) =>
                      value.isEmpty ? 'Informe um nome' : null,
                  onSaved: (newValue) => print(newValue),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) =>
                      value.isEmpty ? 'Informe um e-mail' : null,
                  onSaved: (newValue) => print(newValue),
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  validator: (value) =>
                      value.isEmpty ? 'Informe uma URL' : null,
                  onSaved: (newValue) => print(newValue),
                ),
              ],
            ),
          ),
        ));
  }
}
