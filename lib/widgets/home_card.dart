import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.black87.withOpacity(0.5),
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
                      color: Colors.blue,
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
                      color: Colors.blue,
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
                          color: Colors.grey
                      )),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon:  Icon(
                    Icons.search_outlined,
                    color: Colors.grey.shade400,
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
