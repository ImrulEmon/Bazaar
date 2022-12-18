import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/products_provider.dart';
import '../widgets/product_item_widget.dart';
import '../widgets/product_grid_widget.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favourites) {
                productsContainer.showFavouritesOnly();
              } else {
                productsContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourite'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      body: ProductsGridWidget(),
    );
  }
}
