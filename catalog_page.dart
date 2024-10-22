// lib/catalog_page.dart
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'product.dart';
import 'detail_page.dart';

class CatalogPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        id: 1,
        name: 'Manchester United Red Kids Cuff Beanie',
        description:
            'Dilengkapi dengan lambang tim yang terkenal, menunjukkan kebanggaan tim.',
        price: 80000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/c27dae7b99acbf3e403b930dd3a4b766.jpg?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 4.5),

    Product(
        id: 2,
        name: 'MU x New Era Rubber Woven Trucker Cap Navy',
        description:
            'Warna biru tua dan lambang tim berwarna perak menambah tampilan unik.',
        price: 50000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/2238ef52c89a009f9ab749ddd23ef550.jpg?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 5),

    Product(
        id: 3,
        name: 'Manchester United Home Scarf',
        description:
            'Nama klub dijahit ke dalam kain, memastikan semua orang mengetahui loyalitas Anda.',
        price: 20000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/04a6aa2763b90a1ea8bc205a8b4d5520.jpg?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 4.5),

    Product(
        id: 4,
        name: 'Manchester United Embroidered Scarf Black',
        description:
            'Menunjukkan kebanggaan tim Anda, dengan rajutan lembut membuat tetap hangat.',
        price: 20000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/683daa946a8fd351b7458cce900c4363.jpg?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 4.5),

    Product(
        id: 5,
        name: 'MU x Paul Smith Leather Wallet Black',
        description:
            'Dompet Paul Smith menawarkan pengaturan kartu dengan bahan kulit premium.',
        price: 100000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/b254daba9d27758df4bde5455db1e4db.jpg?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 4.5),

    Product(
        id: 6,
        name: 'Manchester United Core Stripe Gymbag Red',
        description:
            'Sempurna untuk penggemar saat nge-gym, dengan tas olahraga Manchester United ini.',
        price: 50000,
        imageUrl:
            'https://mufc-live.cdn.scayle.cloud/images/562c62243af95263ba74e31e0f17c08b.png?brightness=1&width=576&height=768&quality=75&bg=ffffff',
        rating: 4.5),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Catalog'),
        backgroundColor: Colors.white,
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
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(product: product),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar produk
                    Image.network(
                      product.imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 10), // Spacer antara gambar dan teks
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama produk dan Harga
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Rp. ${product.price.toInt()}',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          // Deskripsi produk
                          Text(
                            product.description,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          const SizedBox(height: 5),
                          // Rating dan ikon bintang
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 20.0,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
