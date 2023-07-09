import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../routes/app_routes.dart';

class UserImageScreen extends StatelessWidget {
  final String imageUrl;

  const UserImageScreen({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Hero(
          tag: imageUrl,
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : Hero(
            tag: user.avatarUrl,
            child: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
          );

    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserImageScreen(imageUrl: user.avatarUrl),
            ),
          );
        },
        child: avatar,
      ),
      title: Text(user.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Arma: '),
              Text(user.arma),
            ],
          ),
          Row(
            children: [
              Text('Preço: '),
              Text('R\$ ' + user.preco.toString()),
            ],
          ),
          Row(
            children: [
              Text('Desgaste: '),
              Text(user.desgaste),
            ],
          ),
        ],
      ),
      trailing: SizedBox(
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
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Provider.of<UsersProvider>(context, listen: false)
                              .remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
