import 'package:flutter/material.dart';
import './providers/cart.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './screens/cart_screen.dart';
import './providers/orders.dart';
import './screens/orders_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(         //for using provider .value is used to replace create/builder
      //builder: (ctx) => Products(),  //for provider version <=3
      //create: (_) => Products(),   //for provider version >=4
      value: Products(),
      ),
      ChangeNotifierProvider.value(     
      value: Cart(),
      ),
      ChangeNotifierProvider.value(     
      value: Orders(),
      ),
    ] ,
    // ChangeNotifierProvider.value(         //for using provider .value is used to replace create/builder
    //   //builder: (ctx) => Products(),  //for provider version <=3
    //   //create: (_) => Products(),   //for provider version >=4
    //   value: Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName:(ctx) => ProductDetailScreen(),
          CartScreen.routeName:(ctx) => CartScreen(),
          OrdersScreen.routeName:(ctx) => OrdersScreen(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
