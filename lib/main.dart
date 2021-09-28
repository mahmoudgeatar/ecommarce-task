import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/product_provider.dart';
import 'screens/product_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'task',

        home: ProductScreen(),
      ),
    );
  }
}
