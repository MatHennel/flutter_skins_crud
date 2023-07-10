import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/authentication/components/show_senha_comfirmacao_dialog.dart';
import 'package:flutter_skins_crud/authentication/services/auth_service.dart';
import 'package:flutter_skins_crud/components/user_tile.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:flutter_skins_crud/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_skins_crud/services/crud_services.dart';

import '../data/dummy_users.dart';
import '../models/skin.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  UsersProvider? users;
  CrudService crudService = CrudService();
  List<Skin> listaSkins = [];

  @override
  void initState() {
    refresh();
    print(listaSkins);
    super.initState();
    users = Provider.of<UsersProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    refresh();
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              title: const Text("Remover Conta"),
              onTap: () {
                showSenhaConfirmacaoDialog(context: context, email: "");
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: const Text("Sair"),
              onTap: () {
                AuthService().deslogar();
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Lista de Skins'),
        backgroundColor: Colors.amberAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.USER_FORM);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
          itemCount: listaSkins.length,
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemBuilder: (context, index) {
            final skin = listaSkins[index];

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
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(10),
                child: UserTile(skin),
              ),
            );
          },
        ),
      ),
    );
  }

  refresh() async {
    List<Skin> temp = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await crudService.getFireStore().collection(crudService.getUid()).get();

    for (var doc in snapshot.docs) {
      temp.add(Skin.fromMap(doc.data()));
    }

    setState(() {
      listaSkins = temp;
    });
  }
}
