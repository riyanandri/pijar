import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  const Score({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> score = [
      {
        "subject": "Ilmu Pengetahuan Alam",
        "teacher": "Joko Susilo, S.Pd",
        "score": "90",
        "notes": "sangat baik",
        "color": "blue",
      },
      {
        "subject": "Matematika",
        "teacher": "Sri Suyanti, S.Pd",
        "score": "83",
        "notes": "baik",
        "color": "red",
      },
      {
        "subject": "Pendidikan Agama Islam",
        "teacher": "Abdul Garim, S.Pd",
        "score": "95",
        "notes": "sangat baik",
        "color": "green",
      },
      {
        "subject": "Bahasa Indonesia",
        "teacher": "Sri Suyanti, S.Pd",
        "score": "88",
        "notes": "baik",
        "color": "orange",
      },
      {
        "subject": "Bahasa Jawa",
        "teacher": "Joko Darmono, S.Pd",
        "score": "78",
        "notes": "tingkatkan lagi",
        "color": "lime",
      },
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
                                'Nilai Ujian',
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
                children: score.map((item) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 4.0,
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 24.0,
                          height: 145.0,
                          decoration: BoxDecoration(
                            color: _getColor(item['color']!),
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(25.0),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['subject']!,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  'Guru : ${item['teacher']}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  'Nilai : ${item['score']}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  'Catatan : ${item['notes']}',
                                  style: const TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                          ),
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

  Color _getColor(String colorName) {
    switch (colorName) {
      case "blue":
        return Colors.blue;
      case "red":
        return Colors.red;
      case "green":
        return Colors.green;
      case "orange":
        return Colors.orange;
      case "lime":
        return Colors.lime;
      default:
        return Colors.grey;
    }
  }
}
