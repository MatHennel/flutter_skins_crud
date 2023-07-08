import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:flutter_skins_crud/routes/app_routes.dart';
import 'package:flutter_skins_crud/views/user_form.dart';
import 'package:flutter_skins_crud/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => UsersProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 94, 48, 172)),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
