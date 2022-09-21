import 'package:flutter/material.dart';
import 'package:todo_app/utils/enum/app_theme_enum.dart';

class AppThemes {
  static final appThemeData = {
    AppTheme.dark: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        dividerColor: Colors.black54,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
        )),
        textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.white)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.grey, unselectedItemColor: Colors.white)),
    AppTheme.light: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.white,
        brightness: Brightness.light,
        backgroundColor: const Color(0xFFE5E5E5),
        dividerColor: const Color(0xFF757575),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.black, foregroundColor: Colors.white),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(Colors.black)),
        ),
        textTheme: const TextTheme(subtitle1: TextStyle(color: Colors.black)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
        ))
  };
}
