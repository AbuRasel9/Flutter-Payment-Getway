import 'package:flutter/material.dart';
import 'package:payment_getway/utils/enum.dart';
import 'package:payment_getway/utils/static_value.dart';
import 'package:payment_getway/view/checkOutView/helper/payment_helper.dart';

class CheckOutView extends StatefulWidget {
  const CheckOutView({super.key});

  @override
  State<CheckOutView> createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  PaymentGatewayType? selectedGetway;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            onPressed: selectedGetway == null
                ? () {}
                : () {
                    onButtonTap(selectedGetway!);
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
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedGetway = item.gateway;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.image ?? "",
                            height: 30,
                            width: 30,
                            fit: BoxFit.fill,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "${item.paymentName}",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                    ),
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
