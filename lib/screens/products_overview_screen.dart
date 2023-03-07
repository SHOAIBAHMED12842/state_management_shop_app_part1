//import 'package:flutter/src/foundation/key.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './cart_screen.dart';
//import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid.dart';
//import '../models/product.dart';
//import '../widgets/product_item.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  //final List<Product> loadedProducts = ;
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);   //using providers
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  //productsContainer.showFavoritesOnly(); //using provider
                  _showOnlyFavorites = true;
                } else {
                  // productsContainer.showAll();        //using provider
                  _showOnlyFavorites = false;
                }
              });
              // if(selectedValue == FilterOptions.Favorites){     //move to set state
              //   //productsContainer.showFavoritesOnly(); //using provider
              //      _showOnlyFavorites = true;
              // }else {
              //  // productsContainer.showAll();        //using provider
              //    _showOnlyFavorites = false;
              // }

              //print(selectedValue);
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(builder: (_, cart,ch) => Badge(
            // child: IconButton(
            //   icon: Icon(
            //     Icons.shopping_cart,
            //   ),
            //   onPressed: () {},
            // ),
            child: ch,
            value: cart.itemCount.toString(),
          ),
          child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ), 
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}

// class ProductsGrid extends StatelessWidget {             //move to he seperate wwidgets
//   const ProductsGrid({
//     Key key,
//     @required this.loadedProducts,
//   }) : super(key: key);

//   final List<Product> loadedProducts;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(10),
//       itemCount: loadedProducts.length,
//       itemBuilder: (ctx, i) => ProductItem(
//           loadedProducts[i].id,
//           loadedProducts[i].title,
//           loadedProducts[i].imageUrl),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 3 / 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//     );
//   }
// }
