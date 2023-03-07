//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import '../providers/cart.dart';

import '../providers/product.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false) ;//listen: false  if not listen to the provider);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
              // push(
              //   MaterialPageRoute(
              //     builder: (ctx) => ProductDetailScreen(title),
              //   ),
              // );
            },
            child: Container(
              //width: 500,
              child: Image.network(
                product.imageUrl,
                //fit: BoxFit.cover, //to cover side
              ),
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
      builder: (ctx, product, _) =>IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).accentColor,
            ),
            //child: Text('Never changes'),
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                cart.addItem(product.id, product.price, product.title);
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      
      // child: ClipRRect(
      //   borderRadius: BorderRadius.circular(10),
      //   child: GridTile(
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.of(context).pushNamed(
      //           ProductDetailScreen.routeName,
      //           arguments: product.id,
      //         );
      //         // push(
      //         //   MaterialPageRoute(
      //         //     builder: (ctx) => ProductDetailScreen(title),
      //         //   ),
      //         // );
      //       },
      //       child: Image.network(
      //         product.imageUrl,
      //         fit: BoxFit.cover,
      //       ),
      //     ),
      //     footer: GridTileBar(
      //       backgroundColor: Colors.black87,
      //       leading: IconButton(
      //         icon: Icon(
      //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
      //         ),
      //         onPressed: () {
      //           product.toggleFavoriteStatus();
      //         },
      //         color: Theme.of(context).accentColor,
      //       ),
      //       title: Text(
      //         product.title,
      //         textAlign: TextAlign.center,
      //       ),
      //       trailing: IconButton(
      //         icon: Icon(
      //           Icons.shopping_cart,
      //         ),
      //         onPressed: () {},
      //         color: Theme.of(context).accentColor,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
