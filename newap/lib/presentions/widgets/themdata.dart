import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newap/app/app_colors.dart';

ThemeData lightThemm() => ThemeData(
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 18,
              color: AppColor.black,
              fontWeight: FontWeight.w600)),
      primaryColor: AppColor.botomNavColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20, selectedItemColor: AppColor.botomNavColor),
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: AppColor.grey,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: AppColor.white,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: AppColor.black, fontSize: 20, fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(
            color: AppColor.black,
          )),
    );
ThemeData darkThemm() => ThemeData(
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18, color: AppColor.white, fontWeight: FontWeight.w600)),
    primaryColor: Colors.deepOrange,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: AppColor.grey,
        backgroundColor: AppColor.scaffoldColor,
        elevation: 20,
        selectedItemColor: AppColor.botomNavColor),
    scaffoldBackgroundColor: AppColor.scaffoldColor,
    appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 39, 36, 36),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: AppColor.scaffoldColor,
        elevation: 0,
        titleTextStyle: TextStyle(
            color: AppColor.white, fontSize: 20, fontWeight: FontWeight.w700),
        iconTheme: IconThemeData(
          color: AppColor.white,
        )));
