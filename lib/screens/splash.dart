import 'package:flutter/material.dart';
import 'package:pijar/screens/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Set background color to white
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          _buildSplashPage(
            imagePath: 'assets/welcoming1.png', // Path gambar pertama
            description: 'Berkomunikasi dengan guru untuk mengetahui Perkembangan peserta didik.',
          ),
          _buildSplashPage(
            imagePath: 'assets/welcoming2.png', // Path gambar kedua
            description: 'Melihat Daftar Kehadiran dan hasil belajar Peserta didik.',
          ),
          _buildSplashPage(
            imagePath: 'assets/welcoming3.png', // Path gambar ketiga
            description: 'Dengan Hangat Kami Sambut Anda di Sekolah Pijar, Tempat Di Mana Setiap Hari Adalah Kesempatan untuk Bersinar.',
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,  // Match background color with the Scaffold
        height: 60,
        alignment: Alignment.center,
        child: _currentIndex != 2
            ? ElevatedButton(
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set background color to blue
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Lanjut',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        )
            : ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const Login()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Set background color to blue
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Mulai',
              style: TextStyle(color: Colors.white), // Set text color to white
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSplashPage({required String imagePath, required String description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imagePath),
          const SizedBox(height: 24),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
