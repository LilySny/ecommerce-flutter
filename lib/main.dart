import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_mobx/product/view/product_page.dart';
import 'login/view/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        "/products": (context) => ProductPage()
      },
    );
  }
}
