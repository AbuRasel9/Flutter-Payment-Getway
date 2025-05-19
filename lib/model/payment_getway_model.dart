import '../utils/enum.dart';

class PaymentOption {
  final PaymentGatewayType gateway;
  final String paymentName;
  final String image;

  PaymentOption({
    required this.gateway,
    required this.paymentName,
    required this.image,
  });
}
