import 'package:comercio/controllers/product_controller.dart';
import 'package:comercio/controllers/user_controller.dart';
import 'package:comercio/ui/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
      ],
      child: MaterialApp(
        title: 'E-comerce Jonas',
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}