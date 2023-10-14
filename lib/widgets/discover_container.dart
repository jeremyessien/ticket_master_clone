import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ticket_master_clone/widgets/recently_viewed.dart';

class DiscoverScreenContainer extends StatefulWidget {
  const DiscoverScreenContainer({Key? key}) : super(key: key);

  @override
  _DiscoverScreenContainerState createState() =>
      _DiscoverScreenContainerState();
}

class _DiscoverScreenContainerState extends State<DiscoverScreenContainer> {
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/doj.jpeg',
    'assets/trav.jpg'
  ];
  final List<String> artistName = ['Doja Cat', 'Travis Scott', "Guns N' Roses"];
  final List<String> description = [
    'Get your tickets now for The Scarlet Tour!',
    'Get tickets to see him when he stops in your city.',
    'See the powerhouse rock band when they stop in your city. Get your tickets today!'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          CarouselSlider.builder(
            itemCount: _images.length,
            options: CarouselOptions(
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _images[index],
                    height: 150,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          artistName[index],
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color:  Color(0xff0566ea),
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text(
                          description[index],
                          style: GoogleFonts.lato(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
          Container(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                    height:
                        30.0), // Add spacing between the carousel and indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _images.map((url) {
                    int index = _images.indexOf(url);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == index ?  Color(0xff0566ea) : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 20.0),
                 Text(
                  'Recently Viewed',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),),
                const SizedBox(height: 5.0),
                 Text(
                  'Jump back into the action.',

                   style: GoogleFonts.lato(
                     textStyle: const TextStyle(
                     color: Colors.grey,
                       fontSize: 15
                     ),
                   ),                ),
                const SizedBox(height: 20.0),
                const RecentlyViewed(),
                const SizedBox(height: 20.0),
                 Text(
                  'Browse by Category ',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
