import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/widgets/product_item_body.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Product"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProvider>(
          builder: (context, state, _) {
            return GridView.builder(
                itemCount: state.favoriteProduct.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3.1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                        Orientation.portrait)
                        ? 2
                        : 3),
                itemBuilder: (context, index) {
                  var product = state.favoriteProduct[index];
                  return ProductItemBody(
                    product: product,
                    action: false,
                  );
                });
          },
        ),
      ),
    );
  }
}
