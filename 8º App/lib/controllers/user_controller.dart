import 'package:comercio/models/prduct_model.dart';
import 'package:comercio/models/user_model.dart';
import 'package:flutter/material.dart';

import '../ui/pages/telaSucesso.dart';

class UserController with ChangeNotifier {
  List<UserModel> users = [
    UserModel(username: "Jonas", email: "jnchucro@senai.com.br")
  ];

  //Método para adicionar um produto ao carrinho de um usuário
  void addToCart(String userEmail, ProductModel product) {
    UserModel? user = users.firstWhere((u) => u.email == userEmail);
    if (user.email.isNotEmpty) {
      user.products.add(product);
    }
  }

  void cadastro(context, String nomeNovo, String senhaNova) {
    var newUser = UserModel(username: nomeNovo, email: senhaNova);
    users.add(newUser);
  }

  void login(context, String username, String email) {
    var result = users.where((item) => item.username == username);
    var resultDois = users.where((item) => item.email == email);
    if (result.isNotEmpty && resultDois.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => TelaSucesso()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Email ou Usuário inválidos')));
    }
    //printo o resultado
    print(result);
    print(resultDois);
  }

  void addToFavorite(String userUsername, ProductModel product) {
    print('cheguei aqui');
    UserModel? user = users.firstWhere((u) => u.username == userUsername);
    print('esse é o user ${user.username}');
    if (user.username.isNotEmpty) {
      print('produto add');
      user.favorites.add(product);
    }
    notifyListeners();
  }

  Future<List<ProductModel>> favoriteProductsUser(index) async {
    return users[index].favorites;
  }
}
