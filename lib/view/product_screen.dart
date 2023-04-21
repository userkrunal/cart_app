import 'package:cart_app/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  ProductProvider? providerF;
  ProductProvider? providerT;
  @override
  Widget build(BuildContext context) {
    providerF=Provider.of<ProductProvider>(context,listen: false);
    providerT=Provider.of<ProductProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Product",style: TextStyle(color: Colors.pink.shade50),),centerTitle: true,
        backgroundColor: Colors.purple.shade900,
        actions: [
          IconButton(onPressed: () {

            Navigator.pushNamed(context, 'cart');

          }, icon: Icon(Icons.add_shopping_cart,color: Colors.pink.shade50))
        ],
        leading: Icon(Icons.shop_2,color: Colors.pink.shade50),
      ),
      body: ListView.builder(itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, 'shop',arguments: index);
          },
          focusColor: Colors.pink.shade50,
          tileColor: Colors.pink.shade50,
          selectedColor: Colors.pink.shade50,
          title: Text("${providerF!.productList[index].name}",style: TextStyle(fontSize: 20,color: Colors.purple.shade700),),
          subtitle: Text("${providerF!.productList[index].price}",style: TextStyle(fontSize: 15,color: Colors.purple.shade700),),
          leading: Container(height: 50,width: 50,decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage("${providerF!.productList[index].path}")),
          ),),
          trailing: Icon(Icons.arrow_forward_ios_sharp),
        ),
      ),itemCount: providerF!.productList.length),
    ));
  }
}
