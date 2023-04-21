import 'package:cart_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  ProductProvider? providerF;
  ProductProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF=Provider.of<ProductProvider>(context,listen: false);
    providerT=Provider.of<ProductProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Cart Screen",style: TextStyle(color: Colors.pink.shade50),),centerTitle: true,
        backgroundColor: Colors.purple.shade700,
      ),
      body: ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          focusColor: Colors.pink.shade50,
          tileColor: Colors.pink.shade50,
          selectedColor: Colors.pink.shade50,
          title: Text("${providerT!.cartList[index].name}"),
          subtitle: Text("${providerT!.cartList[index].price!*providerT!.cartList[index].qa!}"),
          leading: Container(height: 50,width: 50,decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image:AssetImage("${providerT!.cartList[index].path}")),
          ),),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {
                providerT!.increment(index);
              }, icon: Icon(Icons.add_circle_outline)),
              Text("${providerT!.cartList[index].qa}"),
              IconButton(onPressed: () {
                providerT!.decrement(index);
              }, icon: Icon(Icons.remove_circle_outline)),
              IconButton(onPressed: () {
                providerF!.delete(index);
              }, icon: Icon(Icons.delete)),
            ],
          ),
        ),
      ),itemCount: providerF!.cartList.length),
    ));
  }
}
