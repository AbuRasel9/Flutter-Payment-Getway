import 'package:payment_getway/utils/enum.dart';

void onButtonTap(PaymentGatewayType selected) {
  switch (selected) {
    case PaymentGatewayType.bkash:
      bkashPayment();
      break;

    case PaymentGatewayType.nagad:
      nagadPayment();
      break;

    default:
      print("select payment getway");
      break;
  }
}

void bkashPayment() {
  print("Bkash Payment Started");
}

void nagadPayment() {
  print("Nagad Payment Started");
}

void rocketPayment() {
  print("Rocket Payment Started");
}
