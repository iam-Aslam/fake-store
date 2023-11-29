import 'package:fakestore/controller/product_controller.dart';
import 'package:fakestore/views/home/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.blue,
        ),
        body: Consumer<ProductProvider>(
          builder: (context, provider, child) {
            provider.fetchProducts();
            if (provider.products.isEmpty) {
              if (provider.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return const Center(child: Text('Failed to load products.'));
              }
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: size.height / 150,
                      mainAxisSpacing: size.width / 50),
                  itemCount: provider.products.length,
                  itemBuilder: (context, index) {
                    final product = provider.products[index];
                    return ProductTile(
                      id: product.id.toString(),
                      name: product.title,
                      category: product.category,
                      price: product.price.toString(),
                      image: product.image,
                      rating: product.rating.rate.toString(),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
