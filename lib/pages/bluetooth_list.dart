import 'package:flutter/material.dart';
import 'dashboard.dart';

class BluetoothList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Bluetooth Devices'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Device 1'),
            onTap: () {
              // Assume connection is successful
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            title: Text('Device 2'),
            onTap: () {
              // Assume connection is successful
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          // Add more devices as needed
        ],
      ),
    );
  }
}
