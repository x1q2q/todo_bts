import 'package:flutter/material.dart';
import 'package:todo_bts/src/utils/app_colors.dart';
import 'package:todo_bts/src/views/todo_page.dart';

class TodoBtsAPP extends StatelessWidget {
  const TodoBtsAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Outfit',
        colorScheme: const ColorScheme.light().copyWith(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
        ),
      ),
      home: const TodoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
