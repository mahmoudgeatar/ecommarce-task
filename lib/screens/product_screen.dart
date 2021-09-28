import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/const/const_color.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/screens/add_product.dart';
import 'package:task/screens/chart_screen.dart';
import 'package:task/widgets/icon_button.dart';
import 'package:task/widgets/product_item_body.dart';
import 'favScreen.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ProductProvider>(
          builder: (context, state, _) {
            return Text("total: ${state.totalPrice}");
          },
        ),
        actions: [
          Consumer<ProductProvider>(
            builder: (context, state, _) {
              return IconButtonWidget(
                icon: Icons.favorite,
                iconColor: Colors.red,
                listLenght: state.favoriteProduct.length,
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                   return FavScreen();
                  }));
                },
              );
            },
          ),
          Consumer<ProductProvider>(
            builder: (context, state, _) {
              return IconButtonWidget(
                icon: Icons.shopping_cart_sharp,
                iconColor: MyColors.myBlack,
                listLenght: state.chartList.length,
                function: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChartScreen();
                  }));
                  },
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddProduct();
          }));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProvider>(
          builder: (context, state, _) {
            return GridView.builder(
                itemCount: state.products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 3.1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? 2
                        : 3),
                itemBuilder: (context, index) {
                  var product = state.products[index];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.up,
                    onDismissed: (direction){
                      if(product.stock>=product.productOrderNumber){
                        state.addProductToChart(
                            product);
                        state.addToTotalPrice(product.price);
                      }
                    },
                    child: Dismissible(
                      direction: DismissDirection.startToEnd,
                      onDismissed: (direction){
                      if(direction==DismissDirection.startToEnd){
                        state.addToFavList(product,
                            product.fav);
                      }
                      },
                        key: UniqueKey(),
                      child: Stack(
                        children: [
                          ProductItemBody(
                            product: product,
                            action: true,
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                              icon: product.fav == false
                                  ? Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    )
                                  : Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                              onPressed: () {
                                state.addToFavList(product,
                                    product.fav);

                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
