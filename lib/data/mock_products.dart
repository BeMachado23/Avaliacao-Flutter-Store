import '../models/product_model.dart';

List<Product> getMockProducts() {
  return [
    Product(
      id: 'p1',
      name: 'Camiseta Flutter',
      description: 'Uma camiseta confortável com o logo do Flutter. 100% algodão.',
      price: 79.99,
      imageUrl: 'assets/images/camisa_flutter.jpg',
    ),
    Product(
      id: 'p2',
      name: 'Caneca com código',
      description: 'Caneca de cerâmica que apresenta linhas de código.',
      price: 49.90,
      imageUrl: 'assets/images/caneca_codigo.jpg',
    ),
    Product(
      id: 'p3',
      name: 'Notebook Developer Pro',
      description: 'Potência máxima para compilar seus projetos em segundos. 32GB RAM.',
      price: 8999.00,
      imageUrl: 'assets/images/Alienware-m15-teclado.jpg',
    ),
    Product(
      id: 'p4',
      name: 'Mouse Ergonômico',
      description: 'Evite dores no pulso com este mouse vertical.',
      price: 249.50,
      imageUrl: 'assets/images/mouse_ergonomico.jpg',
    ),
    Product(
      id: 'p5',
      name: 'Teclado Mecânico',
      description: 'Sinta o "click" e a resposta tátil de um verdadeiro teclado mecânico.',
      price: 499.99,
      imageUrl: 'assets/images/teclado_mecanico.jpg',
    ),
     Product(
      id: 'p6',
      name: 'Livro "Flutter uma abordagem prática"',
      description: 'Aprenda Flutter de forma didática.',
      price: 89.90,
      imageUrl: 'assets/images/flutter_livro.jpg',
    ),
  ];
}