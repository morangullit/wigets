import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Un simple Booleano
final isDarkmodeProvider = StateProvider((ref) => false);

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un simple Entero
final selecterColorProvider = StateProvider((ref) => 0);