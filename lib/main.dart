import 'package:easacc_task/core/services/bloc_observer.dart';
import 'package:easacc_task/view_model/login_view_model/login_view_model.dart';
import 'package:easacc_task/view_model/settings_view_model/settings_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () {
      runApp(
        MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LoginViewModel()),
            BlocProvider(create: (_) => SettingsViewModel()),
          ],
          child: const MyApp(),
        ),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easacc task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
