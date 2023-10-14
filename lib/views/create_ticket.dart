import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import the dart:convert library

class TicketCreationScreen extends StatefulWidget {
  const TicketCreationScreen({super.key});

  @override
  _TicketCreationScreenState createState() => _TicketCreationScreenState();
}

class _TicketCreationScreenState extends State<TicketCreationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Creation'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Create Ticket'),
              Tab(text: 'Set Name'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [CreateTicketView(), CreateProfileName()],
            ),
          ),
        ],
      ),
    );
  }

// ...
}

class CreateTicketView extends StatefulWidget {
  const CreateTicketView({Key? key}) : super(key: key);

  @override
  State<CreateTicketView> createState() => _CreateTicketViewState();
}

class _CreateTicketViewState extends State<CreateTicketView> {
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

  void createTicket() async {
    print('Button pressed');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
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
    Navigator.pop(context);

    // Print the status code along with other details
    print('Status Code: ${response.statusCode}');
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      // Ticket creation successful, show success dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Ticket creation successful!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _titleController.clear();
                  _sectionController.clear();
                  _rollController.clear();
                  _seatController.clear();
                  _imgNameController.clear();
                  _showDateController.clear();
                  _venueController.clear();
                  _tourTitleController.clear();
                  _ticketHeaderController.clear();
                  _entryController.clear();
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Ticket creation failed, show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Ticket creation failed. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
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
    );
  }
}

class CreateProfileName extends StatefulWidget {
  const CreateProfileName({Key? key}) : super(key: key);

  @override
  State<CreateProfileName> createState() => _CreateProfileNameState();
}

class _CreateProfileNameState extends State<CreateProfileName> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  void createDetails() async {
    print('Button pressed');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    String email = _emailController.text;
    String name = _nameController.text;

    Map<String, String> requestBody = {
      'email' : email,
      'name' : name,
      // 'tickettitle': title,
      // 'section': section,
      // 'roll': roll,
      // 'seat': seat,
      // 'imgname': imgName,
      // 'showdate': showDate,
      // 'venue': venue,
      // 'tourtitle': tourTitle,
      // 'ticketheader': ticketHeader,
      // 'entrys': entry,
    };

    String jsonBody = jsonEncode(requestBody);

    print('API URL: https://ticket-clone.up.railway.app/name');
    print('Request Body (JSON): $jsonBody');
    final response = await http.post(
      Uri.parse('https://ticket-clone.up.railway.app/name'),
      headers: {'Content-Type': 'application/json'}, // Set content type to JSON
      body: jsonBody,
    );
    Navigator.pop(context);

    print('Status Code: ${response.statusCode}');
    print('Response: ${response.body}');

    if (response.statusCode == 200) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Ticket creation successful!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _nameController.clear();
                  _emailController.clear();
                  Navigator.pop(context); // Go back to the previous screen
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Ticket creation failed, show error dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Ticket creation failed. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Input Name'),
          ),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Input Email'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: createDetails,
            child: const Text('Submit'),
          ),
        ],
      ),
    )));
  }
}
