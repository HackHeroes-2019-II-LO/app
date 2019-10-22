import 'package:flutter/material.dart';

ThemeData defaultTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.grey,
      primaryColor: Colors.blue.shade800,
      accentColor: Colors.blue.shade300,
      accentColorBrightness: Brightness.dark,
      textSelectionColor: Colors.blue.shade300.withOpacity(0.5),
      textSelectionHandleColor: Colors.blue.shade800,
      disabledColor: Colors.grey.shade500,
      scaffoldBackgroundColor: Colors.grey.shade900,
      canvasColor: Colors.transparent,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.grey.shade300,
            displayColor: Colors.grey.shade500,
          ),
      dividerColor: Colors.grey.shade600,
      toggleableActiveColor: Colors.blue.shade800,
      highlightColor: Colors.white10,
      splashColor: Colors.white10,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.grey.shade700,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.grey.shade300,
            ),
      ),
      bottomAppBarColor: Colors.grey[850],
      cardColor: Colors.grey[850],
    );
