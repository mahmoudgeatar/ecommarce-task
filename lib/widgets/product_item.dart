import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/const/const_color.dart';
import 'package:task/provider/product_provider.dart';

class Productitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context,state,_){
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  border: Border.all(
                      color: MyColors.myBlack,
                      width: .5
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        "assets/lap.png",
                      ),
                      Text("laptop"),
                      Text("discription"),
                      Row(
                        children: [
                          Text("Price : "),
                          Text("27889"),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                          Text("1"),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add))
                        ],
                      ),
                    ]),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],

        );
      },
    );
  }
}


