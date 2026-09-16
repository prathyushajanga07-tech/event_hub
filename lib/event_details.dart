import 'package:flutter/material.dart';

class EventDetailsPage extends StatefulWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final IconData icon;

  const EventDetailsPage({
    super.key,
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.icon,
  });

  @override
  State<EventDetailsPage> createState() =>
      _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  bool registered = false;

  void registerForEvent() {
    setState(() {
      registered = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'You have successfully registered for this event!',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 20),

            CircleAvatar(
              radius: 55,
              child: Icon(
                widget.icon,
                size: 55,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              widget.title,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              elevation: 3,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_month),
                        const SizedBox(width: 15),

                        Expanded(
                          child: Text(
                            widget.date,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        const Icon(Icons.location_on),
                        const SizedBox(width: 15),

                        Expanded(
                          child: Text(
                            widget.location,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Align(
              alignment: Alignment.centerLeft,

              child: const Text(
                'About the Event',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              widget.description,

              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton.icon(
                onPressed:
                    registered ? null : registerForEvent,

                icon: Icon(
                  registered
                      ? Icons.check
                      : Icons.event_available,
                ),

                label: Text(
                  registered
                      ? 'Registered'
                      : 'Register for Event',

                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}