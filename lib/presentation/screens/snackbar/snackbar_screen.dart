import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('¿Estása seguro?'),
        content: const Text(
            'Laborum aliqua aliqua amet fugiat laborum. Ut sit enim voluptate consectetur elit ex elit. Excepteur sunt ut exercitation proident.'),
        actions: [
          TextButton( onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Snackbar y diálogos')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Magna adipisicing irure qui ad ex enim ea adipisicing quis ipsum fugiat non irure adipisicing. Elit laboris et commodo incididunt laborum occaecat ullamco et ea. Reprehenderit aliquip tempor proident ex aute qui proident est ullamco exercitation sit nostrud. Et nisi dolor veniam Lorem quis pariatur tempor nisi commodo.')
                  ]);
                },
                child: Text('Licencias usadas')),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text('Mostrar snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
      ),
    );
  }
}
