import 'package:bloc_change_theme/bloc/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          ThemeMode themeMode = state.themeMode;
          return MaterialApp(
            themeMode: themeMode,
            darkTheme: ThemeData.dark(),
            title: 'Flutter Demo',
            home: const AppView(),
          );
        },
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...ThemeMode.values.map((themeMode) {
                  return RadioListTile<ThemeMode>(
                    value: themeMode,
                    groupValue: state.themeMode,
                    title: Text(themeMode.name),
                    onChanged: (newThemeMode) {
                      if (newThemeMode != null) {
                        context.read<ThemeBloc>().add(
                            ThemeModeSwitchedEvent(themeMode: newThemeMode));
                      }
                    },
                  );
                }).toList()
              ],
            ),
          );
        },
      ),
    );
  }
}
