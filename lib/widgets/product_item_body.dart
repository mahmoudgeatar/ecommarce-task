import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/widgets/action_buttons.dart';

class ProductItemBody extends StatelessWidget {
  var product;
  bool action;
  ProductItemBody({this.product,required this.action});

  @override
  Widget build(BuildContext context) {
    return   Card(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
              Text(product.name),
              Text(product.discription),
              Row(
                children: [
                  Text("Price : "),
                  Text(product.price.toString(),style: TextStyle(
                    color:product.discount == null?Colors.black :Colors.green,
                  ),),
                  SizedBox(width: 6),
                  product.discount == null
                      ? Container()
                      : Text(
                    product.discount.toString(),
                    style: TextStyle(
                        decoration:
                        TextDecoration.lineThrough,
                        color: Colors.red),
                  ),
                ],
              ),
              action==false? Container()  :ActionButtons(
                product:product
              ),
            ]),
      ),
    );
  }
}
