import 'package:comercio/controllers/user_controller.dart';
import 'package:comercio/ui/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
  //criamos o objeto controller
  UserController userController = UserController();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(texto: 'Login'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                  hintText: 'Nome de usuário', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Email', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
                onPressed: () {
                  userController.login(
                      context, nomeController.text, emailController.text);
                },
                child: const Text('Login')),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    userController.cadastro(
                        context, nomeController.text, emailController.text);
                  },
                  child: const Text('Cadastrar')),
            ),
          ],
        ),
      ),
    );
  }
}
