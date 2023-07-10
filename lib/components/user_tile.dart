import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:flutter_skins_crud/views/user_list.dart';

import '../models/skin.dart';
import '../routes/app_routes.dart';
import '../services/crud_services.dart';

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
  final Skin skin;
  CrudService crudService = CrudService();

  UserTile(this.skin);

  @override
  Widget build(BuildContext context) {
    final avatar = skin.avatarUrl == null || skin.avatarUrl.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : Hero(
            tag: skin.avatarUrl,
            child: CircleAvatar(backgroundImage: NetworkImage(skin.avatarUrl)),
          );

    return ListTile(
      leading: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserImageScreen(imageUrl: skin.avatarUrl),
            ),
          );
        },
        child: avatar,
      ),
      title: Text(skin.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Arma: '),
              Text(skin.arma),
            ],
          ),
          Row(
            children: [
              Text('Preço: '),
              Text('R\$ ' + skin.preco.toString()),
            ],
          ),
          Row(
            children: [
              Text('Desgaste: '),
              Text(skin.desgaste),
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
                  arguments: skin,
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
                          crudService.remove(skin);

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
