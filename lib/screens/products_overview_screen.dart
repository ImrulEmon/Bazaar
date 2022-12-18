// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid_widget.dart';
import '../widgets/badge_widget.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    // final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => BadgeWidget(
              value: cart.itemCount.toString(),
              child: ch,
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favourites,
                child: Text('Only Favourite'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Show All'),
              ),
            ],
          ),
        ],
      ),
      body: ProductsGridWidget(_showOnlyFavourites),
    );
  }
}
