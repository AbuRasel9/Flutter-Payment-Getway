import 'package:flutter/material.dart';
import 'package:payment_getway/view/checkOutView/check_out_view.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckOutView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
