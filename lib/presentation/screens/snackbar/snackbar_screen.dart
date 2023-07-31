import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackBarScreen extends StatelessWidget {
  
  static const String name = 'snackbar_screen';
  
  const SnackBarScreen({super.key});


  void showCustomSnackbar( BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar( 
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {},),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void openDialog ( BuildContext context ){

    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas seguro?'),
        content: const Text('Sit et sint dolore in et sint proident qui do consectetur exercitation. Amet voluptate nisi Lorem consequat aliquip ut occaecat sit excepteur anim officia enim commodo sint. Dolore nisi veniam minim excepteur exercitation aliqua labore dolor aute sunt. Elit tempor velit elit anim est et nulla sint voluptate eu nulla elit cillum ea. Laboris dolore culpa sint elit labore. Consequat tempor cupidatat eiusmod commodo.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
          TextButton(onPressed: () => context.pop(), child: const Text('Cancela'))
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Diálogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child: const Text('Licencias usuadas'),
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Cupidatat ex anim deserunt ex occaecat anim proident elit laborum fugiat. Enim velit duis pariatur consectetur. Qui cupidatat velit ipsum commodo. Voluptate quis excepteur qui deserunt id esse Lorem id amet enim ut magna. Ipsum irure magna proident id esse minim occaecat dolor aliquip veniam consequat sit aliqua esse.')
                  ]
                );
              }, 
            ),

            FilledButton.tonal(
              child: const Text('Mostrar Diálogos'),
              onPressed: () => openDialog(context), 
            )
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Text('Mostrar Snackbar'),
        label: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () =>  showCustomSnackbar(context),
      ),
    );
  }
}