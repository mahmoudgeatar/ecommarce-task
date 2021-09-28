import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/product_provider.dart';
import 'package:task/widgets/action_buttons.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<ProductProvider>(
          builder: (context, state, _) {
            return Text("total: ${state.totalPrice}");
          },
        ),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, state, _) {
          return ListView.builder(
              itemCount: state.chartList.length,
              itemBuilder: (context, index) {
                var product =state.chartList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      trailing:product.image==""? Image.file(product.file!,fit: BoxFit.fill,):Image.asset(product.image,fit: BoxFit.fill,),
                      title: Text(product.name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("total price : ${product.totalProductPrice}"),
                          SizedBox(
                            width: MediaQuery.of(context).size.width/3,
                            child: ActionButtons(
                              product: product,
                            ),
                          ),
                        ],
                      ),

                      
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
