import 'package:payment_getway/utils/enum.dart';

import '../model/payment_getway_model.dart';

class StaticValue {
  static List<PaymentOption> getways = [
    PaymentOption(
      paymentName: "bkash",
      image: "assets/images/bkash.png", gateway: PaymentGatewayType.bkash,
    )
  ];
}
