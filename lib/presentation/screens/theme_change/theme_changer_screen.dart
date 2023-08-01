import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangeScreen extends ConsumerWidget {

  static const name = 'theme_change_screen';

  const ThemeChangeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final isDarkmode = ref.watch(isDarkmodeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        actions: [
          IconButton(
            icon: Icon( isDarkmode ? Icons.dark_mode_outlined : Icons.light_mode_outlined),
            onPressed: (){
              ref.read(isDarkmodeProvider.notifier).update((isDarkmode) => !isDarkmode);
            }, 
          ),
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {

    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColors = ref.watch(selecterColorProvider);

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];

        return RadioListTile(
          title: Text('Este color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColors, 
          onChanged: (value) {
            ref.read(selecterColorProvider.notifier).state = index;
          },
        );
      },
    );
  }
}