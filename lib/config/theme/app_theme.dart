import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.purpleAccent,
  Colors.red,
  Colors.pink,
  Colors.yellow,
  Colors.indigo,
  Colors.orange,
  Colors.green
];

class AppTheme{

  final int selectColor;
  final bool isDarkmode;

  AppTheme({
    this.selectColor = 0,
    this.isDarkmode = false,
    }): assert(selectColor >= 0, 'Select color must be greater then 0'),
        assert(selectColor < colorList.length, 'Select color must less or equal ${ colorList.length -1 }');


  ThemeData getThema() => ThemeData(
    useMaterial3: true,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectColor],
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );


  AppTheme copyWith({
    int? selectColor,
    bool? isDarkmode,
  }) => AppTheme(
    selectColor: selectColor ?? this.selectColor,
    isDarkmode: isDarkmode ?? this.isDarkmode,
  );


}