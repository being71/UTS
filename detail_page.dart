// lib/detail_page.dart
import 'package:flutter/material.dart';
import 'product.dart';
import 'cart.dart';
import 'cart_page.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final Product product;

  DetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ),
                );
              },
            ),
          ],
          backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image inside a rounded rectangle with shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(color: Colors.grey, width: 0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(product.imageUrl),
              ),
            ),
            const SizedBox(height: 16),

            // Rounded rectangle for product name, price, and description with shadow
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 1.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row for product name and rating
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Product name
                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Rating
                      Column(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 24.0,
                          ),
                          Text(
                            product.rating.toString(),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Price without decimal
                  Text(
                    'Harga: Rp. ${product.price.toInt()}', // Remove decimal
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Description
                  Text(
                    'Description: ${product.description}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Add to Cart button on the right
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<Cart>(context, listen: false).addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                      '${product.name} Telah Ditambahkan ke Keranjang',
                    )),
                  );
                },
                child: const Text(
                  'Tambah ke Keranjang',
                  style: TextStyle(
                      color: Colors.white), // Change text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 223, 17, 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
