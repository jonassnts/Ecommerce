import 'package:comercio/controllers/user_controller.dart';
import 'package:comercio/models/prduct_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserController>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Favoritos')),
      body: FutureBuilder<List<ProductModel>>(
        future: userProvider.favoriteProductsUser(0),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<ProductModel>? myFavorites = snapshot.data;
            if (myFavorites!.isEmpty) {
              return const Center(child: Text('Sem dados'));
            }
            return ListView.builder(
                itemCount: myFavorites.length,
                itemBuilder: (context, index) {
                  return Text(myFavorites[index].name);
                });
          }
          return const Text('Sem dados');
        },
      ),
    );
  }
}
