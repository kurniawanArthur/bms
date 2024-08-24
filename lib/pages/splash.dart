import 'package:flutter/material.dart';
import 'connect.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/bg_img.jpg', // Path to your SVG asset
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                   Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Connect()),
                );
                  // Aksi tombol
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), // Membuat tombol menjadi bulat
                  padding: EdgeInsets.all(20), // Mengatur padding tombol
                  backgroundColor: Colors.white, // Warna background tombol
                ),
                child: Icon(
                  Icons.arrow_forward, // Ikon panah
                  color: Colors.white, // Warna ikon
                  size: 24, // Ukuran ikon
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}