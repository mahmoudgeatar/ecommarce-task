import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/product_provider.dart';

class ActionButtons extends StatefulWidget {
  var product;
  ActionButtons({this.product});

  @override
  _ActionButtonsState createState() => _ActionButtonsState();
}

class _ActionButtonsState extends State<ActionButtons> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //remove to chart button
        IconButton(
            onPressed: () {
              if (widget.product.productOrderNumber != 0) {
                provider.removeProductToChart(widget.product);
                provider.minFromTotalPrice(widget.product.price);
              }
            },
            icon: Icon(Icons.remove)),

        Text(widget.product.productOrderNumber.toString()),

        //add to chart button
        widget.product.stock >= widget.product.productOrderNumber
            ? IconButton(
                onPressed: () {
                  if (provider.chartList.contains(widget.product)) {
                    provider.updateChart(widget.product);
                  } else {
                    if (widget.product.stock >=
                        widget.product.productOrderNumber) {
                      provider.addProductToChart(widget.product);
                      provider.addToTotalPrice(widget.product.price);
                    }
                  }
                },
                icon: Icon(Icons.add))
            : Container()
      ],
    );
  }
}
