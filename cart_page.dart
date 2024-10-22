// lib/cart_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product image
                        Image.network(
                          item.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                            width: 10), // Spacer between image and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Product name
                              Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              // Quantity adjustment buttons
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove, size: 16),
                                    onPressed: () {
                                      cart.decreaseQuantity(item);
                                    },
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add, size: 16),
                                    onPressed: () {
                                      cart.increaseQuantity(item);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10), // Spacer
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Subtotal
                            Text(
                              'Rp. ${item.price.toInt() * item.quantity}',
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 25),
                            // Delete icon
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                cart.removeItem(item);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10), // Add space above the total section
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, -3), // Shadow direction
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Check if the total price is 0
                if (cart.totalPrice == 0) ...[
                  // Message when cart is empty
                  Text(
                    'Belum ada barang di keranjang!',
                    style: TextStyle(color: Colors.red, fontSize: 16.0),
                  ),
                ] else ...[
                  // Display total price
                  Text(
                    'Total: Rp. ${cart.totalPrice.toInt()}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Checkout button
                  ElevatedButton(
                    onPressed: () {
                      _showPaymentOptions(context, cart);
                    },
                    child: Text(
                      'Pesan Sekarang',
                      style: TextStyle(
                          color: Colors.white), // Change text color to white
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 17, 2),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showPaymentOptions(BuildContext context, Cart cart) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pilih Metode Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.credit_card), // Add debit card icon
              title: Text('Debit Card'),
              onTap: () {
                _processPayment(context, cart, 'Debit Card');
              },
            ),
            ListTile(
              leading: Icon(Icons.qr_code), // Add QR code icon
              title: Text('QR Code'),
              onTap: () {
                _processPayment(context, cart, 'QR Code');
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void _processPayment(BuildContext context, Cart cart, String paymentMethod) {
    // Simulate payment processing
    Navigator.of(context).pop(); // Close the payment options dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Pembayaran Berhasil'),
        content: Text(
            'Anda membayar dengan $paymentMethod. Pesanan anda akan diproses!'),
        actions: [
          TextButton(
            onPressed: () {
              cart.clear(); // Clear the cart
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
