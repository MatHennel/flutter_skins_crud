import 'package:flutter/material.dart';
import 'package:flutter_skins_crud/provider/users.dart';
import 'package:flutter_skins_crud/routes/app_routes.dart';
import 'package:flutter_skins_crud/views/user_form.dart';
import 'package:flutter_skins_crud/views/user_list.dart';
import 'package:flutter_skins_crud/views/user_login.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm(),
          AppRoutes.USER_LOGIN: (_) => UserLogin(),
        },
      ),
    );
  }
}
