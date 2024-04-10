import 'package:flutter/material.dart';
import 'package:flutter_crud/components/user_tile.dart';
import 'package:flutter_crud/provider/UsersProvider.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    final UsersProviders users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              users.put(const User(
                id: '2',
                name: "Teste",
                email: "teste@gmail.com",
                avatarUrl:
                    'https://gravatar.com/avatar/8116589faaf35cd6527cfaea43dec789?s=400&d=robohash&r=x',
              ));
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}
