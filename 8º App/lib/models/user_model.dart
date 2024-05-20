import 'package:comercio/models/prduct_model.dart';

class UserModel {
  String username;
  String email;
  List<ProductModel> products = []; //lista de produtos que o usuário possui
  List<ProductModel> favorites =[]; //lista de produtos favoritados pelo usuário
  UserModel({required this.email, required this.username});

  void addProduct(ProductModel product) {
    products.add(product);
  }

  void addFavorite(ProductModel product) {
    if (!favorites.contains(product)) {
      favorites.add(product);
    }
  }

  void removeProduct(int index) {
    products.removeAt(index);
  }

  @override
  String toString() {
    return "nome: $username, email: $email";
  }
}
