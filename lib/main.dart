import 'package:cart_app/provider/product_provider.dart';
import 'package:cart_app/view/cart_screen.dart';
import 'package:cart_app/view/product_screen.dart';
import 'package:cart_app/view/pruduct_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) =>ProductScreen(),
          'shop':(context) => ProductShop(),
          'cart':(context) => CartScreen(),
        },
      ),
    )
  );
}