import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Product> favoriteProducts;
  final Function(String) onToggleFavorite;

  const FavoritesScreen({
    Key? key,
    required this.favoriteProducts,
    required this.onToggleFavorite,
  }) : super(key: key);

  void _selectProduct(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => ProductDetailScreen(
          product: product,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (favoriteProducts.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 80, color: Colors.grey),
            SizedBox(height: 16),
            Text('Você ainda não tem produtos favoritos.', style: TextStyle(fontSize: 18, color: Colors.grey)),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: favoriteProducts.length,
      itemBuilder: (ctx, index) {
        final product = favoriteProducts[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.imageUrl),
            ),
            title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () => onToggleFavorite(product.id),
            ),
            onTap: () => _selectProduct(context, product),
          ),
        );
      },
    );
  }
}