import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switcher/bloc/theme_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<ThemeBloc, ThemeData>(
            builder: (context, themeData) {
              return CupertinoSwitch(
                  value: themeData == ThemeData.dark(),
                  onChanged: (bool val) {
                    BlocProvider.of<ThemeBloc>(context).add(ThemeSwitchEvent());
                  });
            },
          ),
        ],
      ),
      body: const Center(child: Text("Theme changing app")),
    );
  }
}
