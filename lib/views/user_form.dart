import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/models/user.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formDATA = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formDATA['id'] = user.id!;
      _formDATA['name'] = user.name;
      _formDATA['email'] = user.email;
      _formDATA['avatarUrl'] = user.avatarUrl;
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    if (arguments != null && arguments is User) {
      final user = arguments as User;
      _loadFormData(user);
    } else {
      // Lógica para lidar com o caso em que os argumentos não são do tipo User ou são nulos
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
        backgroundColor: Colors.cyanAccent,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              if (_form.currentState?.validate() == true) {
                _form.currentState?.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formDATA['id'],
                    name: _formDATA['name']!,
                    email: _formDATA['email']!,
                    avatarUrl: _formDATA['avatarUrl']!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formDATA['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o nome.';
                  }
                  return null;
                },
                onSaved: (value) => _formDATA['name'] = value!,
              ),
              TextFormField(
                initialValue: _formDATA['email'],
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, digite o e-mail.';
                  }
                  // Adicione validações adicionais para o formato do e-mail, se necessário
                  return null;
                },
                onSaved: (value) => _formDATA['email'] = value!,
              ),
              TextFormField(
                initialValue: _formDATA['avatarUrl'],
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formDATA['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
