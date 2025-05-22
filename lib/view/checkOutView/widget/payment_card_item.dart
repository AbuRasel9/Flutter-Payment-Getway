import 'package:flutter/material.dart';

class PaymentCardItem extends StatefulWidget {
  const PaymentCardItem(
      {super.key,
      required this.onTap,
      required this.imageLink,
      required this.paymentName,
      this.selectedGetway});

  final VoidCallback onTap;
  final String imageLink, paymentName;
  final bool? selectedGetway;

  @override
  State<PaymentCardItem> createState() => _PaymentCardItemState();
}

class _PaymentCardItemState extends State<PaymentCardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: widget.selectedGetway ?? false
                  ? Colors.blue
                  : Colors.black.withOpacity(.1))),
      child: InkWell(
        onTap: widget.onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //payment image
            Image.asset(
              widget.imageLink,
              height: 30,
              width: 30,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              width: 15,
            ),
            //payment name
            Text(
              widget.paymentName,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
