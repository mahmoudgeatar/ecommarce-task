import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task/model/product_model.dart';

class ProductProvider extends ChangeNotifier {
  int totalPrice = 0;
  List<ProductModel> products = [
    ProductModel(
        totalProductPrice: 0,
        image: "assets/lap.png",
        name: "labtop",
        discription: "Dell 1530",
        price: 5000,
        discount: 6000,
        fav: false,
        stock: 5,
        productOrderNumber: 0),
    ProductModel(
        totalProductPrice: 0,
        image: "assets/lap.png",
        name: "labtop",
        discription: "Dell 1520",
        price: 4000,
        discount: null,
        fav: false,
        stock: 5,
        productOrderNumber: 0),
    ProductModel(
        totalProductPrice: 0,
        image: "assets/lap.png",
        name: "labtop",
        discription: "Dell 1530",
        price: 5000,
        discount: 5300,
        fav: false,
        stock: 3,
        productOrderNumber: 0),
    ProductModel(
        totalProductPrice: 0,
        image: "assets/lap.png",
        name: "labtop",
        discription: "Dell 1520",
        price: 4000,
        discount: 4200,
        fav: false,
        stock: 5,
        productOrderNumber: 0),
  ];


  addProductToChart(ProductModel product) {
    product.stock--;
    product.productOrderNumber++;
    product.totalProductPrice = product.productOrderNumber * product.price;

    chartList.add(product);
    notifyListeners();
  }

  removeProductToChart(ProductModel product) {
    product.stock++;
    product.productOrderNumber--;
    chartList.remove(product);
    notifyListeners();
  }

  updateChart(ProductModel product) {
    product.stock--;
    product.productOrderNumber++;
    product.totalProductPrice = product.productOrderNumber * product.price;

    notifyListeners();
  }

  List<ProductModel> favoriteProduct = [];

  addToFavList(ProductModel product, fav) {
    if (product.fav == false) {
      product.fav = true;
      favoriteProduct.add(product);
      notifyListeners();
    } else {
      product.fav = false;
      favoriteProduct.remove(product);
      notifyListeners();
    }
  }

  List<ProductModel> chartList = [];

  addToTotalPrice(int price) {
    totalPrice = totalPrice + price;
    notifyListeners();
  }

  minFromTotalPrice(int price) {
    totalPrice = totalPrice - price;
    notifyListeners();
  }

  //get image
  late File _image;

  get image => _image;
  //image picker from gallery function------------------------------------
  Future<void> imagePickers(ImageSource source) async {
    try {
      final myFile = await ImagePicker().getImage(source: source);
      _image = await File(myFile!.path);
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }
}
