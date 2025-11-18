import 'package:flutter/material.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  final List<Product> products;
  final Function(String) onToggleFavorite;

  const ProductListScreen({
    Key? key,
    required this.products,
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
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(product.imageUrl),
              onBackgroundImageError: (_, __) {},
              child: product.imageUrl.isEmpty ? const Icon(Icons.image) : null,
            ),
            title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              'R\$ ${product.price.toStringAsFixed(2)}',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            trailing: IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              color: product.isFavorite ? Colors.red : Colors.grey,
              onPressed: () => onToggleFavorite(product.id),
            ),
            onTap: () => _selectProduct(context, product),
          ),
        );
      },
    );
  }
}