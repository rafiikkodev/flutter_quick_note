import 'package:flutter/material.dart';
import 'package:flutter_quick_note/model/user_model.dart';
import 'package:flutter_quick_note/services/product_services.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductServices products = ProductServices();
  late Future<List<dynamic>> _products;

  @override
  void initState() {
    super.initState();
    _products = products.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel data = Get.arguments["data"];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome, ${data.username}",
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                "Your Products",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              FutureBuilder<List<dynamic>>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Tidak ada produk tersedia.'));
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var product = snapshot.data![index];
                        return Card(
                          elevation: 2,
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: const Icon(Icons.shopping_bag),
                            title:
                                Text(product['name'] ?? 'Nama Tidak Tersedia'),
                            subtitle: Text(product['brand'] ?? '-'),
                            trailing: Text(
                              "Rp ${product['price']}",
                              style: const TextStyle(
                                fontSize: 122,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
