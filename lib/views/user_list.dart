import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/components/user_tile.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:flutter_skins_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UsersProvider users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Skins'),
        backgroundColor: Colors.cyanAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                  context,
                  AppRoutes
                      .USER_FORM); // Adicione essa linha para navegar para a rota do formulário
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.fromLTRB(10, 10, 10, 10), // Adicione o espaçamento aqui
        child: ListView.separated(
          itemCount: users.count,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            final user = users.byIndex(index);

            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: UserTile(user),
            );
          },
        ),
      ),
    );
  }
}
