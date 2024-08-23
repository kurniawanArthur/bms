import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF4755AB), // Warna latar belakang ungu
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 250), // Spasi atas
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  ),
                  children: <TextSpan>[
                      TextSpan(text: 'Gama'),
                      TextSpan(
                        text: 'BMS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ),
              const Text(
                'battery management\nsystem', // Menggunakan \n untuk ganti baris
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const Spacer(), // Mendorong teks versi ke bawah
              const Text(
                'BMS UGM v.1.0',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), // Spasi bawah
            ],
          ),
        ),
      ),);
  }
}