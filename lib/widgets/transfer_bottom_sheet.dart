import 'package:flutter/material.dart';

class BottomSheetTicketRow extends StatelessWidget {
  final String? descr;
  final int? amount;
  const BottomSheetTicketRow({Key? key, this.descr, this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$descr: ',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16, // Adjust the font size as needed
                ),
              ),
              TextSpan(
                text: amount.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16, // Adjust the font size as needed
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10,),
      ],
    );
  }
}
