import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // SizedBox(height: 100),
              const Text("Welcome, Buddy!", style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color:  Colors.black
              ),),
              const SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  ),
                  children: <TextSpan>[
                      TextSpan(text: 'The battery is not detected'),
                      TextSpan(text: '\nplease turn on your bluetooth'),
                    ],
                  ),
              ),
              const SizedBox(height:20),
              Container(
                width: 200, // Sesuaikan ukuran lingkaran
                height: 200,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient( // Efek gradien pada lingkaran
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF6776D8), Color(0xFF4755AB)], // Warna gradien
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Connect',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'to Battery',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10), // Spasi antara teks dan ikon
                    Icon(
                      Icons.bluetooth_disabled, // Ikon Bluetooth
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(icon: const Icon(Icons.home), onPressed: () {}),
              IconButton(icon: const Icon(Icons.bar_chart_sharp), onPressed: () {}),
              IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  
  }
}