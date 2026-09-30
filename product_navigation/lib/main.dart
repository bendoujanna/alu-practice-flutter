import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProductListPage(),
    );
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  final List<Map<String, dynamic>> products = const [
    {
      'name': 'Pixel',
      'description': 'Pixel is the most featureful phone ever',
      'price': 800,
    },
    {
      'name': 'Laptop',
      'description': 'Laptop is the most productive development tool',
      'price': 2000,
    },
    {
      'name': 'Tablet',
      'description': 'Tablet is useful for meetings',
      'price': 1500,
    },
    {
      'name': 'Pendrive',
      'description': 'Pendrive is useful for storing files',
      'price': 100,
    },
    {
      'name': 'Floppy Drive',
      'description': 'Floppy Drive is an old storage device',
      'price': 50,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Navigation'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: Container(
                width: 60,
                height: 60,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    product['name'][0],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              title: Text(product['name']),
              subtitle: Text(
                '${product['description']}\nPrice: ${product['price']}',
              ),
              trailing: const Icon(Icons.star, color: Colors.red),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(
                      name: product['name'],
                      description: product['description'],
                      price: product['price'],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final String name;
  final String description;
  final int price;

  const ProductDetailsPage({
    super.key,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.blue,
            child: Center(
              child: Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(description),
          const SizedBox(height: 25),
          Text(
            'Price: $price',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.red),
              Icon(Icons.star, color: Colors.red),
              Icon(Icons.star, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }
}