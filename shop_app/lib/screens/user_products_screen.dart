import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/products.dart';

import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

import './edit_products_screen.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    return Scaffold(
        appBar: AppBar(title: Text('Your Products'), actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductsScreen.routeName);
            },
          )
        ]),
        drawer: AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () {
            return _refreshProducts(context);
          },
          child: Padding(
              padding: EdgeInsets.all(8),
              child: Stack(
                children: [
                  ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: false,
                      itemCount: productsData.items.length,
                      itemBuilder: (_, i) => Column(
                            children: [
                              UserProductItem(
                                  productsData.items[i].id,
                                  productsData.items[i].title,
                                  productsData.items[i].imageUrl),
                              Divider(),
                            ],
                          ))
                ],
              )),
        ));
  }
}
