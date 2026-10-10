
import 'package:flutter/material.dart';
import 'event_details.dart';
import 'login.dart';
import 'widgets/event_card.dart';
import 'api_demo.dart';

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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'API Demo',
            icon: const Icon(Icons.cloud_download),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ApiDemoPage(),
                ),
              );
            },
          ),
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
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 900),
                builder: (context, opacity, child) {
                  return Opacity(
                    opacity: opacity,
                    child: child,
                  );
                },
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isNarrow = constraints.maxWidth < 400;

                    return Text(
                      'Welcome to Event Hub 👋',
                      style: TextStyle(
                        fontSize: isNarrow ? 23 : 28,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
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

                  return EventCard(
                    title: event['title']!,
                    date: event['date']!,
                    location: event['location']!,
                    icon: getIcon(event['icon']!),
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
