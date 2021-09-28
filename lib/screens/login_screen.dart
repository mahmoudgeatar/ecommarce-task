
import 'package:flutter/material.dart';
import 'package:task/screens/product_screen.dart';
import 'package:task/widgets/text_feild.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  TextEditingController _nameController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_basket_outlined,size: 200,color: Colors.orange,),
                  CustomTextfield(
                    hintText: "Name",
                    icon: Icons.person,
                    controller: _nameController,
                  ),
                  CustomTextfield(
                    hintText: "Phone",
                    icon: Icons.phone,
                    ketBoardType: TextInputType.phone,
                    controller: _phoneController,
                  ),
                  CustomTextfield(
                    hintText: "Email",
                    icon: Icons.email,
                    ketBoardType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  RaisedButton(onPressed: (){
                    if (_globalKey.currentState!.validate()) {
                      FocusScope.of(context).requestFocus(FocusNode());
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ProductScreen();
                      }));
                    }
                  },child: Text("Run App"),)
                ],
              ),
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
