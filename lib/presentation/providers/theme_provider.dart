import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

// Un simple Booleano
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple Entero
final selecterColorProvider = StateProvider((ref) => 0);

// Un Object de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) => ThemeNotifier(),);

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode () {
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectColor: colorIndex);
  }

}