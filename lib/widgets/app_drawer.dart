import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(int) onSelectScreen;
  final int selectedIndex;

  const AppDrawer({Key? key, required this.onSelectScreen, required this.selectedIndex}) : super(key: key);

  Widget _buildListTile(String title, IconData icon, int screenIndex, BuildContext context) {
    final isSelected = screenIndex == selectedIndex;
    return ListTile(
      leading: Icon(icon, size: 26, color: isSelected ? Colors.indigo : null),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.indigo : null,
        ),
      ),
      selected: isSelected,
      selectedTileColor: Colors.indigo.withOpacity(0.1),
      onTap: () => onSelectScreen(screenIndex),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: const Text('Menu'), automaticallyImplyLeading: false),
          _buildListTile('Início', Icons.home, 0, context),
          _buildListTile('Produtos', Icons.shopping_bag, 1, context),
          _buildListTile('Meus Produtos', Icons.favorite, 2, context),
          _buildListTile('Sobre', Icons.info, 3, context),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, size: 26),
            title: const Text('Sair', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
    );
  }
}