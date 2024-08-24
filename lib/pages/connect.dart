import 'package:flutter/material.dart';
import 'bluetooth_list.dart';
import 'dashboard.dart';

class Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect Bluetooth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Bluetooth not connected'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BluetoothList()),
                );
              },
              child: Text('Select Bluetooth'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Assume Bluetooth is connected for demo purposes
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Dashboard()),
                );
              },
              child: Text('Proceed to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }
}
