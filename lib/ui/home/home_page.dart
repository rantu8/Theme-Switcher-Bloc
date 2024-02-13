import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:theme_switcher/ui/bloc/theme_bloc.dart';
import 'package:theme_switcher/ui/theme/app_themes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Theme Switcher')),
      body: Center(
        child: Text('Primary Color', style: Theme.of(context).textTheme.headline3!.copyWith(color: Theme.of(context).primaryColor))
      ),
      floatingActionButton: SpeedDial(
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 3,
          childPadding: const EdgeInsets.all(5),
          spaceBetweenChildren: 4,
                    children: [
              for(AppTheme theme in AppTheme.values)
                    SpeedDialChild(
                      label: theme.toString().split('.').last,
                      backgroundColor: appThemeData[theme]?.primaryColor,
                onTap: () {
                   context.read<ThemeCubit>().toggleTheme(appThemeData[theme]!);
                },
                shape: const CircleBorder(),
                child: Container(
                  color: appThemeData[theme]?.primaryColor,
                )
              ),
            ],
        ),
    );
  }
}
