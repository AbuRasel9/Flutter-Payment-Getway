import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:payment_getway/utils/enum.dart';
import 'package:payment_getway/utils/static_value.dart';
import 'package:payment_getway/view/checkOutView/helper/payment_helper.dart';
import 'package:payment_getway/view/checkOutView/widget/payment_card_item.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  PaymentGatewayType? selectedGetway;
  int? selectItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGrey6,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "CheckOut",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      //checkOutbutton
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:selectedGetway==null ?Colors.blue.withOpacity(.3): Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: selectedGetway == null
                ? () {}
                : () {
                    onButtonTap(selectedGetway!, 1, context);
                  },
            child: const Text(
              "Continue to payment",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Please select a payment method",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: StaticValue.getways.length ?? 0,
                itemBuilder: (context, index) {
                  final item = StaticValue.getways[index];
                  //payment card item
                  return PaymentCardItem(
                    onTap: () {
                      setState(() {
                        selectedGetway = item.gateway;
                        selectItem = index;
                      });
                    },
                    imageLink: item.image,
                    paymentName: item.paymentName,
                    selectedGetway: selectItem == index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
