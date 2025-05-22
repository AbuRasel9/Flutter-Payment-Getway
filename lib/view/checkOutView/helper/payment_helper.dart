import 'package:bkash/bkash.dart';
import 'package:flutter/material.dart';
import 'package:payment_getway/utils/enum.dart';

void onButtonTap(PaymentGatewayType selectedGetway, double amount, context) {
  switch (selectedGetway) {
    case PaymentGatewayType.bkash:
      bkashPayment(amount, context);
      break;

    case PaymentGatewayType.nagad:
      nagadPayment(context);
      break;

    default:
      print("Select payment gateway");
      break;
  }
}

// Bkash package instance create
final bkash = Bkash(
  logResponse: true,
  //for live payment if marchent account have than bkash all info give for live payment
  //if i want to live payment than commentout blew code and give all info than run and all work good for live payment
 /* bkashCredentials: BkashCredentials(
    username: username,
    password: password,
    appKey: appKey,
    appSecret: appSecret,
    isSandbox: false,
  ),*/
);

// Bkash payment gateway
Future<void> bkashPayment(double amount, BuildContext context) async {
  try {
    //payment create for test not live
    final response = await bkash.pay(
      context: context,
      amount: amount,
      merchantInvoiceNumber: "test",
    );

    if (response.paymentId != null && response.paymentId!.isNotEmpty) {
      // Success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
      );
    } else {
      // If paymentId is empty or null
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Payment Failed: Invalid payment response")),
      );
    }
  } on BkashFailure catch (e) {
    // Failure message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${e.message}")),
    );
  } catch (e) {
    // Any other unexpected error
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Something went wrong: $e")),
    );
  }
}

void nagadPayment(BuildContext context) {
  // Example
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Nagad Payment Started")),
  );
}
