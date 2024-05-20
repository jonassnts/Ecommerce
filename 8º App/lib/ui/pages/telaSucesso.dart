import 'package:comercio/controllers/product_controller.dart';
import 'package:comercio/controllers/user_controller.dart';
import 'package:comercio/models/prduct_model.dart';
import 'package:comercio/ui/pages/favoritePages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaSucesso extends StatelessWidget {
  const TelaSucesso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Produtos'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const FavoritePage()));
              },
              icon: const Icon(Icons.favorite)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      body: Consumer2<ProductController, UserController>(
        builder: (context, product, userController, child) {
          List<ProductModel> products = product.products;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(products[index].name),
                trailing: IconButton(
                    onPressed: () {
                      print('clique');
                      ProductModel product = ProductModel(
                          name: products[index].name,
                          price: products[index].price,
                          desc: products[index].desc);
                      userController.addToFavorite("Kaian", product);
                    },
                    icon: const Icon(Icons.favorite_outline)),
              );
            },
          );
        },
      ),
    );
  }
}
