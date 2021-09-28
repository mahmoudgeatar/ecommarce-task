import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:task/model/product_model.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/screens/product_screen.dart';
import 'package:task/widgets/text_feild.dart';


class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _productnameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _saleController = TextEditingController();
  TextEditingController _stockController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<ProductProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add product"),
      ),
      body: Form(
        key: _globalKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        child: IconButton(
                            icon: Icon(Icons.image),
                            onPressed: ()  {
                              provider.imagePickers(ImageSource.gallery);
                            }),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        child: IconButton(
                            icon: Icon(Icons.camera),
                            onPressed: () async {
                              provider. imagePickers(ImageSource.camera);
                            }),
                      ),
                    )
                  ],
                ),
                CustomTextfield(
                  hintText: "Product Name",
                  icon: Icons.edit_outlined,
                  controller: _productnameController,
                ),
                CustomTextfield(
                  hintText: "Product Description",
                  icon: Icons.edit_outlined,
                  controller: _descriptionController,
                ),
                CustomTextfield(
                  hintText: "Product Price",
                  icon: Icons.attach_money,
                  controller: _priceController,
                  ketBoardType: TextInputType.number,
                ),
                CustomTextfield(
                  hintText: "Product Sale",
                  icon: Icons.money_off,
                  controller: _saleController,
                  ketBoardType: TextInputType.number,
                ),
                CustomTextfield(
                  hintText: "Product Stock",
                  icon: Icons.storage,
                  controller: _stockController,
                  ketBoardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      provider.products.add(ProductModel(
                        file: provider.image,
                        totalProductPrice: 0,
                         productOrderNumber: 0,
                          image:"",
                          name: _productnameController.text,
                          discription: _descriptionController.text,
                          price: int.parse(_priceController.text),
                          // ignore: unnecessary_null_comparison
                          discount: _saleController.text.isEmpty?null:int.parse(_saleController.text),
                          stock: int.parse(_stockController.text),
                          fav: false));
                     }
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ProductScreen();
                    }));
                  },
                  child: Text("Run App"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
