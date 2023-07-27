import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/home/buttons/buttons_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItems = appMenuItems[index];
        return _CustomListTitle(menuItems: menuItems);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menuItems,
  });

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;


    return ListTile(
      leading: Icon(menuItems.icon, color: colors.primary,),
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary,),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subTitle),
      onTap: () {
        
        //  Navigator.of(context).push(
        //    MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //     ),
        //   );

        Navigator.pushNamed(context, menuItems.link);

      },
    );
  }
}