import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_mobx/product/model/product.dart';
import 'package:flutter_ecommerce_mobx/product/service/product_rest_service.dart';
import 'package:flutter_ecommerce_mobx/product/service/product_service.dart';
import 'package:flutter_ecommerce_mobx/product/store/product_store.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductService _productService;

  @override
  void initState() {
    _productService = ProductRestService(Dio());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
              future: _productService.findProducts(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Product>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  Center(
                    child: CircularProgressIndicator(),
                  );
                if (snapshot.hasData && snapshot.data.isNotEmpty)
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Product product = snapshot.data[index];
                        return Container(
                          height: 60.0,
                          child: Card(
                            child: Image.network(product.imageUrl),
                          ),
                        );
                      });
              })),
    );
  }
}
