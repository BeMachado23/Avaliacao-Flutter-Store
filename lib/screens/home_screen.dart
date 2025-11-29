import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'favorites_screen.dart';
import 'product_list_screen.dart';
import '../widgets/app_drawer.dart';
import '../data/mock_products.dart';
import '../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Product> _allProducts;
  int _selectedScreenIndex = 0;

  void _toggleFavorite(String productId) {
    final productIndex = _allProducts.indexWhere((p) => p.id == productId);
    if (productIndex >= 0) {
      setState(() {
        _allProducts[productIndex].isFavorite = !_allProducts[productIndex].isFavorite;
      });
    }
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    _allProducts = getMockProducts();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProducts = _allProducts.where((p) => p.isFavorite).toList();

    final List<Widget> screens = [
      // 0:Home
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.storefront, size: 100, color: Colors.indigo),
            Text('Bem-vindo à Flutter Store!', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      ProductListScreen(
        products: _allProducts,
        onToggleFavorite: _toggleFavorite,
      ),
      FavoritesScreen(
        favoriteProducts: favoriteProducts,
        onToggleFavorite: _toggleFavorite,
      ),
      
      const AboutScreen(),
    ];
    
    final List<String> screenTitles = ['Início', 'Produtos', 'Meus Produtos', 'Sobre'];

    return Scaffold(
      appBar: AppBar(title: Text(screenTitles[_selectedScreenIndex])),
      drawer: AppDrawer(onSelectScreen: _selectScreen, selectedIndex: _selectedScreenIndex),
      body: screens[_selectedScreenIndex],
    );
  }
  
}