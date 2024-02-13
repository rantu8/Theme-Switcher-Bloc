import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switcher/ui/bloc/bloc_observer.dart';
import 'package:theme_switcher/ui/bloc/theme_bloc.dart';
import 'package:theme_switcher/ui/bloc/theme_state.dart';
import 'package:theme_switcher/ui/home/home_page.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}



class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
      builder: (_, state) {
        return MaterialApp(
          theme: state.themeData,
          home: const HomePage(),
        );
      },
    )
    );
  }
}







