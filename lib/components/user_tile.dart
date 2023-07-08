import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
              icon: Icon(Icons.edit),
              color: Colors.green,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          title: Text('Excluir Usuário'),
                          content: Text('Tem certeza???'),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Nao'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Sim'),
                              onPressed: () {
                                Provider.of<UsersProvider>(context,
                                        listen: false)
                                    .remove(user);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ));
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
