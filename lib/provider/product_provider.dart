import 'package:cart_app/model/product_model.dart';
import 'package:flutter/foundation.dart';

class ProductProvider extends ChangeNotifier
{
  List productList=[
    ProductModel(name: "Mobile",path:"assets/images/img.png" ,price: 125999,qa:1),
    ProductModel(name: "Tv",path:"assets/images/img_1.png" ,price: 10000,qa:1),
    ProductModel(name: "Fruits",path:"assets/images/img_2.png" ,price: 100,qa:1),
    ProductModel(name: "Airdopes",path:"assets/images/air.jpg" ,price: 1299,qa:1),
    ProductModel(name: "USB",path:"assets/images/usb.jpg" ,price: 600,qa:1),
    ProductModel(name: "Smart Watch",path:"assets/images/img_3.png" ,price: 3000,qa:1),
    ProductModel(name: "Sport Shoes",path:"assets/images/img_4.png" ,price: 1473,qa:1),
    ProductModel(name: "Skybages",path:"assets/images/img_5.png" ,price: 699,qa:1),
  ];
  List cartList=[];

  void increment(int index)
  {
    ProductModel p1=cartList[index];
    ProductModel update= ProductModel(path: p1.path,qa: p1.qa!+1,price: p1.price,name: p1.name);
    cartList[index]=update;
    notifyListeners();
  }
  void decrement(int index)
  {
    ProductModel p1=cartList[index];
    if(p1.qa==1)
    {
      delete(index);
    }
    else {

      ProductModel update = ProductModel(name: p1.name, price: p1.price, qa: p1.qa! - 1, path: p1.path);
      cartList[index] = update;
    }
    notifyListeners();
  }
  void delete(int index)
  {
    cartList.removeAt(index);
    notifyListeners();
  }
}