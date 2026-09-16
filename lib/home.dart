import 'package:flutter/material.dart';
import 'event_details.dart';
import 'login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> events = const [
    {
      'title': 'Tech Fest 2026',
      'date': '20 September 2026',
      'location': 'ACE Engineering College',
      'description':
          'A technical festival featuring coding competitions, workshops and exciting tech events.',
      'icon': 'computer',
    },
    {
      'title': 'Hackathon 2026',
      'date': '25 September 2026',
      'location': 'Innovation Lab',
      'description':
          'Build innovative solutions and compete with students from different colleges.',
      'icon': 'code',
    },
    {
      'title': 'Cultural Fest',
      'date': '2 October 2026',
      'location': 'College Auditorium',
      'description':
          'Enjoy music, dance, drama and various cultural performances.',
      'icon': 'music',
    },
    {
      'title': 'Sports Meet',
      'date': '10 October 2026',
      'location': 'College Ground',
      'description':
          'Participate in exciting sports competitions including basketball, cricket and volleyball.',
      'icon': 'sports',
    },
  ];

  IconData getIcon(String icon) {
    switch (icon) {
      case 'computer':
        return Icons.computer;
      case 'code':
        return Icons.code;
      case 'music':
        return Icons.music_note;
      case 'sports':
        return Icons.sports_basketball;
      default:
        return Icons.event;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Event Hub',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),

            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Welcome to Event Hub 👋',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Discover exciting events happening around you.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 25),

              const Text(
                'Upcoming Events',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                itemCount: events.length,

                itemBuilder: (context, index) {
                  final event = events[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    elevation: 4,

                    child: ListTile(
                      contentPadding: const EdgeInsets.all(15),

                      leading: CircleAvatar(
                        radius: 30,
                        child: Icon(
                          getIcon(event['icon']!),
                          size: 30,
                        ),
                      ),

                      title: Text(
                        event['title']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '${event['date']}\n${event['location']}',
                        ),
                      ),

                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),

                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) => EventDetailsPage(
                              title: event['title']!,
                              date: event['date']!,
                              location: event['location']!,
                              description: event['description']!,
                              icon: getIcon(event['icon']!),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}