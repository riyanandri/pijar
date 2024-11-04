import 'package:flutter/material.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> schedule = [
      {
        "day": "Senin",
        "subjects": [
          {
            "startTime": "08:00",
            "endTime": "10:20",
            "title": "Bahasa Indonesia",
            "teacher": "Sri Suyanti, S.Pd",
            "location": "Ruang Kelas",
          }
        ],
      },
      {
        "day": "Selasa",
        "subjects": [
          {
            "startTime": "07:30",
            "endTime": "10:00",
            "title": "Matematika",
            "teacher": "Sri Suyanti, S.Pd",
            "location": "Ruang Kelas",
          },
          {
            "startTime": "10:30",
            "endTime": "12:00",
            "title": "Bahasa Jawa",
            "teacher": "Joko Darmono, S.Pd",
            "location": "Ruang Kelas",
          }
        ],
      },
      {
        "day": "Rabu",
        "subjects": [
          {
            "startTime": "07:30",
            "endTime": "09:30",
            "title": "Seni Budaya",
            "teacher": "Dayat Sudarmono, S.Pd",
            "location": "Ruang Seni",
          }
        ],
      }
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(50.0),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg_header.png'), // Adjust as needed
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white.withOpacity(0.5), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.arrow_back, color: Colors.white),
                                onPressed: null, // Add navigation action here
                              ),
                              SizedBox(width: 16.0),
                              Text(
                                'Jadwal Kelas',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: schedule.map<Widget>((daySchedule) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              daySchedule["day"],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${daySchedule["subjects"].length} MATA PELAJARAN',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Column(
                          children: daySchedule["subjects"].map<Widget>((subject) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              elevation: 4.0,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              subject["startTime"],
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const Icon(Icons.arrow_downward, size: 16.0),
                                            Text(
                                              subject["endTime"],
                                              style: const TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 16.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                subject["title"],
                                                style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const SizedBox(height: 4.0),
                                              Text(
                                                subject["teacher"] ?? '',
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              const SizedBox(height: 8.0),
                                              Row(
                                                children: [
                                                  const Icon(Icons.location_on, size: 16.0, color: Colors.teal),
                                                  const SizedBox(width: 4.0),
                                                  Text(
                                                    subject["location"] ?? '',
                                                    style: const TextStyle(
                                                      fontSize: 14.0,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
