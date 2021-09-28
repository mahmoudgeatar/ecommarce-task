import 'dart:io';

class ProductModel{
   File? file;
  late String name,discription,image;
  late bool fav;
  late int price,stock;
  int? discount;
  int productOrderNumber=0;
  int totalProductPrice=0;


  ProductModel(
      {
         this.file,
        required this.name,
      required this.discription,
      required this.price,
        this.discount,
      required this.image,
      required this.stock,
      required this.fav,
      required this.productOrderNumber,
        required this.totalProductPrice,
      });
}