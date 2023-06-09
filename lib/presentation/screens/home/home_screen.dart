import 'package:flutter/material.dart';
import 'package:flutter_widgets_app/config/menu/menu_items.dart';
import 'package:flutter_widgets_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

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
    return Container(
      child: ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];

          return _CustomListTile(menuItem: menuItem);
        },
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      leading: Icon(
        menuItem.icon,
        color: colors.primary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.primary,
      ),
      onTap: () {
        // Navigator.pushNamed(context, menuItem.link);
        // context.pushNamed(CardsScreen.name);
        context.push(menuItem.link);
      },
    );
  }
}
