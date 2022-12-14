import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../widgets/product_item_widget.dart';
import '../widgets/product_grid_widget.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyShop'),
      ),
      body: ProductsGridWidget(),
    );
  }
}
