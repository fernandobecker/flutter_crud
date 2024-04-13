import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/UsersProvider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                color: Colors.orange,
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                }),
            IconButton(
                onPressed: () {
                  BuildContext dialogContext = context;
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Excluir Usuário"),
                      content: const Text("Tem certeza que deseja excluir o usuário ?"),
                      actions: <Widget>[
                        TextButton(
                          child: const Text("Não"),
                          onPressed: () => Navigator.of(dialogContext).pop(false),
                        ),
                        TextButton(
                          child: const Text("Sim"),
                          onPressed: () => Navigator.of(dialogContext).pop(true),
                        )
                      ],
                    ),
                  ).then((confirmed) {
                    if (confirmed != null && confirmed) {
                      Provider.of<UsersProviders>(dialogContext, listen: false).remove(user);
                    }
                  });
                },
                color: Colors.red,
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
