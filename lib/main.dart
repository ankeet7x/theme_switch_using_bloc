import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switcher/bloc/theme_bloc.dart';
import 'package:theme_switcher/home.dart';

Future<void> main() async {
  runApp(BlocProvider(
    create: (context) => ThemeBloc()..add(InitialThemeSetEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      builder: (context, state) {
        return MaterialApp(
          theme: state,
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
