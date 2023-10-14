import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  List<Map<String, dynamic>> ticketDetails = [];

  @override
  void initState() {
    super.initState();
    // Call the API to fetch ticket details
    fetchTicketDetails();
  }
  Future<void> fetchTicketDetails() async {
    try {
      final response = await http
          .get(Uri.parse('https://ticket-clone.up.railway.app/names'));

      if (response.statusCode == 200) {
        setState(() {
          // Explicitly cast the decoded JSON list to List<Map<String, dynamic>>
          ticketDetails =
          List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        print('Failed to load ticket details: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching ticket details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1e2128),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0xff1e2128),
          title: const Text('My Account',
              style: TextStyle(color: Colors.white, fontSize: 15)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Container(
                  color: Colors.white,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: const EdgeInsets.all(25),
                  color: const Color(0xff1e2128),
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${ticketDetails.isNotEmpty ? ticketDetails[0]['name'] ?? 'N/A' : 'N/A'}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                        const TextSpan(text: '\n'), // Add a new line for separation
                        const TextSpan(text: '\n'), // Add a new line for separation
                        TextSpan(
                          text: '${ticketDetails.isNotEmpty ? ticketDetails[0]['email'] ?? 'N/A' : 'N/A'}',
                          style: TextStyle(
                            color: Colors.white,
                            // fontWeight: FontWeight.w600,
                            // fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),

              ),
              Padding(
                    padding:
                        const EdgeInsets.only(left: 15.0, right: 10.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        ListTile(
                          leading: Image.asset('assets/message.png', height: 25, width: 25,),
                          title: const Text('My Notifications'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading:  Image.asset('assets/notification bell.png', height: 25, width: 25,),
                          title: const Text('Recieve Notifications'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Location Settings',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        ListTile(
                          leading:  Image.asset('assets/location.png', height: 25, width: 25,),
                          title: const Text('My Location'),
                          trailing: GestureDetector(
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'All of USA',
                                  style: TextStyle(color: Colors.blue),
                                ),
                                SizedBox(width: 5,),

                                Image.asset('assets/edit.png', height: 25, width: 25),
                              ],
                            ),
                          ),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 10,
                              child: Image.asset('assets/united-states.png'),
                            ),
                          ),

                          title: const Text('My Country'),
                          trailing: GestureDetector(
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'United States',
                                  style: TextStyle(color: Colors.blue),
                                ),
                            SizedBox(width: 5,),
                            Image.asset('assets/edit.png', height: 25, width: 25),

                              ],
                            ),
                          ),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.keyboard_arrow_left_sharp),
                          title: const Text('Location Based Content'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Preferences',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite_border),
                          title: const Text('My Favorites'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: Image.asset('assets/icons8-wallet-48.png', height: 25, width: 25,),
                          title: const Text('Saved Payments Methods'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite_border),
                          title: const Text('Change App Icon'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Help & Guidance',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.help_outline_sharp,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          title: const Text('Need Help?'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.edit,
                              color: Colors.grey.withOpacity(0.5)),
                          title: const Text('Change App Icon'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.book,
                              color: Colors.grey.withOpacity(0.5)),
                          title: const Text('Change App Icon'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ListTile(
                          leading: const Icon(Icons.book, color: Colors.red),
                          title: const Text('Sign Out'),
                          onTap: () {
                            // Handle tap for the first ListTile
                          },
                        ),
                      ],
                    ))
            ]),
                ),
          ),
        ));
  }
}
