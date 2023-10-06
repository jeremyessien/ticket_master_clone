import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import the dart:convert library


class TicketCreationScreen extends StatefulWidget {
  const TicketCreationScreen({super.key});

  @override
  _TicketCreationScreenState createState() => _TicketCreationScreenState();
}

class _TicketCreationScreenState extends State<TicketCreationScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();
  final TextEditingController _seatController = TextEditingController();
  final TextEditingController _imgNameController = TextEditingController();
  final TextEditingController _showDateController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();
  final TextEditingController _tourTitleController = TextEditingController();
  final TextEditingController _ticketHeaderController = TextEditingController();
  final TextEditingController _entryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Creation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Ticket Title'),
            ),
            TextField(
              controller: _sectionController,
              decoration: const InputDecoration(labelText: 'Section'),
            ),
            TextField(
              controller: _rollController,
              decoration: const InputDecoration(labelText: 'Roll'),
            ),
            TextField(
              controller: _seatController,
              decoration: const InputDecoration(labelText: 'Seat'),
            ),
            TextField(
              controller: _imgNameController,
              decoration: const InputDecoration(labelText: 'Image Name'),
            ),
            TextField(
              controller: _showDateController,
              decoration: const InputDecoration(labelText: 'Show Date'),
            ),
            TextField(
              controller: _venueController,
              decoration: const InputDecoration(labelText: 'Venue'),
            ),
            TextField(
              controller: _tourTitleController,
              decoration: const InputDecoration(labelText: 'Tour Title'),
            ),
            TextField(
              controller: _ticketHeaderController,
              decoration: const InputDecoration(labelText: 'Ticket Header'),
            ),
            TextField(
              controller: _entryController,
              decoration: const InputDecoration(labelText: 'Entry'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call the API endpoint with the provided parameters
                createTicket();
              },
              child: const Text('Create Ticket'),
            ),
          ],
        ),
      ),
    );
  }


// ...

  void createTicket() async {
    print('Button pressed');

    // Gather the data from text controllers
    String title = _titleController.text;
    String section = _sectionController.text;
    String roll = _rollController.text;
    String seat = _seatController.text;
    String imgName = _imgNameController.text;
    String showDate = _showDateController.text;
    String venue = _venueController.text;
    String tourTitle = _tourTitleController.text;
    String ticketHeader = _ticketHeaderController.text;
    String entry = _entryController.text;

    // Prepare the request body as JSON
    Map<String, String> requestBody = {
      'tickettitle': title,
      'section': section,
      'roll': roll,
      'seat': seat,
      'imgname': imgName,
      'showdate': showDate,
      'venue': venue,
      'tourtitle': tourTitle,
      'ticketheader': ticketHeader,
      'entrys': entry,
    };

    // Convert the map to JSON using jsonEncode
    String jsonBody = jsonEncode(requestBody);

    // Print details before making the API call
    print('API URL: https://ticket-clone.up.railway.app/ticket');
    print('Request Body (JSON): $jsonBody');

    // Make the API call with JSON data
    final response = await http.post(
      Uri.parse('https://ticket-clone.up.railway.app/ticket'),
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
      body: jsonBody,
    );

    // Print the status code along with other details
    print('Status Code: ${response.statusCode}');
    print('Response: ${response.body}');
  }


}
