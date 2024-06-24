import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/styles/colors.dart';


ThemeData lightTheme = ThemeData(

    primarySwatch: Colors.cyan,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: const AppBarTheme(
        titleSpacing: 20,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.grey,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize:20,
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        )

    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,

        elevation: 20,
        backgroundColor: Colors.white
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ) ),
);

ThemeData darkTheme = ThemeData(
    primarySwatch: defaultColor,
    scaffoldBackgroundColor: HexColor('333739'),
    appBarTheme: const AppBarTheme(
        titleSpacing: 20,

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF43658b),
            statusBarIconBrightness: Brightness.light
        ),
        backgroundColor: Color(0xFF43658b),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize:20,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,

        )

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,

        elevation: 20,
        backgroundColor: HexColor('333739')
    ),
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white
        )
    )
);
