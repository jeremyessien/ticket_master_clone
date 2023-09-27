import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentlyViewed extends StatelessWidget {
  const RecentlyViewed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(40)),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/las vegas logo.png'),
          Text(
            'Las Vegas Raiders',
            style: GoogleFonts.lato(
              textStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cancel_outlined,
                color: Colors.grey,
                weight: 0.5,
                fill: 0.5,
                size: 25,
              ))
        ],
      ),
    );
  }
}
