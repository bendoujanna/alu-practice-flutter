import 'package:flutter/material.dart';

void main() {
  runApp(const ProductNavigationApp());
}

// data model
// A simple class to hold the data for each product
class Product {
  final String name;
  final String shortName; // For the colored square
  final String description;
  final int price;
  final Color color;

  Product({
    required this.name,
    required this.shortName,
    required this.description,
    required this.price,
    required this.color,
  });
}

class ProductNavigationApp extends StatelessWidget {
  const ProductNavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Set the initial screen to our product list
      home: ProductListPage(),
    );
  }
}

// --- SCREEN 1: PRODUCT LIST PAGE ---
class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  // The dummy data matching the screenshot requirements
  final List<Product> products = [
    Product(
      name: 'Pixel',
      shortName: 'pixel 1',
      description: 'Pixel is the most featureful phone ever',
      price: 800,
      color: Colors.blueAccent,
    ),
    Product(
      name: 'Laptop',
      shortName: 'laptop',
      description: 'Laptop is most productive development tool',
      price: 2000,
      color: Colors.greenAccent.shade400,
    ),
    Product(
      name: 'Tablet',
      shortName: 'tablet',
      description: 'Tablet is the most useful device ever for meeting',
      price: 1500,
      color: Colors.amber.shade400,
    ),
    Product(
      name: 'Pendrive',
      shortName: 'pen drive',
      description: 'Pendrive is the stylish phone ever',
      price: 100,
      color: Colors.redAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          // InkWell makes the whole card clickable and gives a ripple effect
          return InkWell(
            onTap: () {
              // NAVIGATION: This is how we move to the details page!
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(product: product),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  // Left side: Colored box with the short name
                  Container(
                    width: 120,
                    height: 120,
                    color: product.color,
                    alignment: Alignment.center,
                    child: Text(
                      product.shortName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Right side: Product details
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            product.description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 8),
                          Text('Price: ${product.price}'),
                          const SizedBox(height: 8),
                          // The 3 red stars
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.red, size: 16),
                              Icon(Icons.star, color: Colors.red, size: 16),
                              Icon(Icons.star, color: Colors.red, size: 16),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- SCREEN 2: PRODUCT DETAILS PAGE ---
class ProductDetailsPage extends StatelessWidget {
  // This page requires a Product object to be passed in
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Top section: Large colored banner
          Container(
            width: double.infinity,
            height: 250,
            color: product.color,
            alignment: Alignment.center,
            child: Text(
              product.shortName,
              style: const TextStyle(
                color: Colors.white, 
                fontSize: 48,
                fontWeight: FontWeight.w300
              ),
            ),
          ),
          const SizedBox(height: 30),
          
          // Details section
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              product.description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          const SizedBox(height: 20),
          Text('Price: ${product.price}'),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.red, size: 24),
              Icon(Icons.star, color: Colors.red, size: 24),
              Icon(Icons.star, color: Colors.red, size: 24),
            ],
          )
        ],
      ),
    );
  }
}