import 'package:cart_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductShop extends StatefulWidget {
  const ProductShop({Key? key}) : super(key: key);

  @override
  State<ProductShop> createState() => _ProductShopState();
}

class _ProductShopState extends State<ProductShop> {
  ProductProvider? providerF;
  ProductProvider? providerT;

  @override
  Widget build(BuildContext context) {
    int i =ModalRoute.of(context)!.settings.arguments as int;
    providerF =Provider.of<ProductProvider>(context,listen: false);
    providerT =Provider.of<ProductProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          title: Text("Product Shop",style: TextStyle(color: Colors.pink.shade50)),centerTitle: true,
          backgroundColor: Colors.purple.shade700,
        ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("${providerF!.productList[i].path}"),fit: BoxFit.fill),
                borderRadius: BorderRadius.circular(30),
                color: Colors.pink.shade50
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${providerF!.productList[i].name}",style: TextStyle(fontSize: 50,color: Colors.purple.shade900),),
            ],
          ),
          SizedBox(height: 9),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${providerF!.productList[i].price}",style: TextStyle(fontSize: 20,color: Colors.purple.shade900)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {

                providerF!.cartList.add(providerF!.productList[i]);

              }, child: Text("Add to card",style: TextStyle(color: Colors.pink.shade50),),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple.shade900),),
            ],
          ),
        ],
      ),
    ));
  }
}
