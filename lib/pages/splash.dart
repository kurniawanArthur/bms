import 'package:flutter/material.dart';
import 'connect.dart';
import "package:bms_jayajayajaya/utility/colors.dart";

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
            Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Gama',
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              )),
                          TextSpan(
                            text: 'VOLT',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "\nBMS Control Panel",
                            style: TextStyle(fontSize: 40,color: AppColors.primary)
                            )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
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
                        backgroundColor:
                            AppColors.primary, // Warna background tombol
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded, // Ikon panah
                        color: Colors.white, // Warna ikon
                        size: 24, // Ukuran ikon
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
