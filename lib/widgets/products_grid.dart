import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/products.dart';
//import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import './product_item.dart';

class ProductsGrid extends StatelessWidget {
  // const ProductsGrid({
  //   Key key,
  //   @required this.loadedProducts,
  // }) : super(key: key);

  // final List<Product> loadedProducts;
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItem : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      //itemCount: loadedProducts.length,
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(     //instead of using create/builder to work with single list/grid widget 
        //create: (c) => products[i],  //chonge create to builder in provider version 3.0
        value: products[i],
        child: ProductItem(
          // loadedProducts[i].id,
          // loadedProducts[i].title,
          // loadedProducts[i].imageUrl),
          // products[i].id,
          // products[i].title,
          // products[i].imageUrl,
        ),
      ),
      // ProductItem(
      // // loadedProducts[i].id,
      // // loadedProducts[i].title,
      // // loadedProducts[i].imageUrl),
      // products[i].id,
      // products[i].title,
      // products[i].imageUrl,
      // ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
