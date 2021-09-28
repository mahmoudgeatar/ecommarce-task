import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String hintText;
  TextInputType? ketBoardType;
  TextEditingController controller;
  IconData icon;
  CustomTextfield(
      {required this.hintText,
        required this.icon,
         this.ketBoardType,
        required this.controller,
      });

   errorName(String str) {
    switch (hintText) {
      case "Name":
        return "Enter $hintText";
      case "Phone":
        return "Enter $hintText";
      case "Email":
        return "Enter $hintText";
      case "Product Name":
        return "Enter $hintText";
      case "Product Description":
        return "Enter $hintText";
      case "Product Price":
        return "Enter $hintText";
      case "Product Stock":
        return "Enter $hintText";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return errorName(hintText);
            }
            return null;
          },
          keyboardType: ketBoardType,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).textTheme.headline3!.color
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(
                color: Colors.red,
                width: 5.0,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            prefixIcon: icon == null
                ? null
                : Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                child: Icon(icon,color: Colors.white,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
