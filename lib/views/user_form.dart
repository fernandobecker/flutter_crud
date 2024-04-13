import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/provider/UsersProvider.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  UserForm({super.key});

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarUrl'] = user.avatarUrl;
    }

  @override
  Widget build(BuildContext context) {
    final User? user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulário de Usuário'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                bool? isValid = _form.currentState?.validate();

                if (isValid != null && isValid) {
                  _form.currentState?.save();

                  Provider.of<UsersProviders>(context, listen: false).put(User(
                    id: _formData['id'] ?? '',
                    name: _formData['name']!,
                    email: _formData['email']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ));

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
                  initialValue: _formData['name'],
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe um nome' : null,
                  onSaved: (newValue) => _formData['name'] = newValue!,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe um e-mail' : null,
                  onSaved: (newValue) => _formData['email'] = newValue!,
                ),
                TextFormField(
                  initialValue: _formData['avatarUrl'],
                  decoration: const InputDecoration(labelText: 'URL do Avatar'),
                  validator: (value) =>
                      value!.isEmpty ? 'Informe uma URL' : null,
                  onSaved: (newValue) => _formData['avatarUrl'] = newValue!,
                ),
              ],
            ),
          ),
        ));
  }
}
