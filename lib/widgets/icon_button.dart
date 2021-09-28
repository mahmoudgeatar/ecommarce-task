import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:task/const/const_color.dart';

class IconButtonWidget extends StatelessWidget {
  late final IconData icon;
  late final Function function;
  late final Color iconColor;
  int listLenght;
  IconButtonWidget({required this.icon,required this.iconColor,required this.function,required this.listLenght});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        function();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10
        ),
        child: Badge(
          badgeColor: MyColors.myWhite,
          borderSide: BorderSide(
              color: MyColors.myBlack,
              width: .5
          ),
          badgeContent: Text(listLenght.toString(),style: TextStyle(
            fontSize: 10
          ),),
          position: BadgePosition(
            bottom: 10,
            end: 0,
          ),
          child: Icon(icon,size: 26,color: iconColor,),
        ),
      ),
    );
  }
}
