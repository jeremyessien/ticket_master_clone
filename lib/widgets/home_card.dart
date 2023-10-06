import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Color(0xff272a31),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 10,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Color(0xff0566ea),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      'City or Zip code',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white
                          ),
                    ),)
                  ],
                ),
                //Add a vertical divider in here white colour
                 Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      color:  Color(0xff0566ea),
                    ),
                     const SizedBox(width: 5,),
                    Text(
                      'All Dates',
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white
                          ),
                    ),)

                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 55,
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for artists, venues....',
                  hintStyle: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          color: Color(0xffd4d2d5),
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon:  Icon(
                    Icons.search_outlined,
                    color:Color(0xffd4d2d5),
                  ),
                ),
                style:  GoogleFonts.lato(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
