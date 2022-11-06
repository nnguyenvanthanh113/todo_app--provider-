import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_provider_learn/provider/todo_provider.dart';

import 'Screens/home.dart';
import 'constants/app_color_constants.dart';
import 'provider/grid_items_provider.dart';

void main() async {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<GirdItems>(
          create: (BuildContext context) => GirdItems()),
      ChangeNotifierProvider<TodoProvider>(
          create: (BuildContext context) => TodoProvider()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gridview Todo',
      theme: ThemeData(
        primarySwatch: AppColorConstants.purple,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColorConstants.bottomSheetBackgroundColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}
