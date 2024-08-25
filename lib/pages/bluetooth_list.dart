import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart'; // Assuming this is your dashboard screen

import 'package:permission_handler/permission_handler.dart';

// Meminta izin lokasi dan memulai pemindaian
void requestLocationPermissionAndScan() async {
  var status = await Permission.location.status;
  if (!status.isGranted) {
    status = await Permission.location.request();
  }

  if (status.isGranted) {
    print("Location permission granted.");
    startScan();
  } else {
    print("Location permission not granted.");
  }
}

void startScan() {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  flutterBlue.startScan(timeout: Duration(seconds: 4)).then((_) {
    // Pemindaian dimulai, sekarang kita mendengarkan hasilnya
    flutterBlue.scanResults.listen((results) {
      print("Scan results:");
      for (ScanResult result in results) {
        print(result);
      }
    });
  }).catchError((error) {
    print("Error starting scan: $error");
  });
}

class BluetoothList extends StatefulWidget {
  @override
  _BluetoothListState createState() => _BluetoothListState();
}

class _BluetoothListState extends State<BluetoothList> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> devices = [];
  List<Map<String, dynamic>> connectedDevices = [];
  static const String connectedDevicesKey = 'connectedDevices';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      requestLocationPermissionAndScan();
    });
    loadConnectedDevices();
  }

  Future<void> loadConnectedDevices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? encodedDevices = prefs.getString(connectedDevicesKey);
    if (encodedDevices != null) {
      setState(() {
        connectedDevices = jsonDecode(encodedDevices).cast<Map<String, dynamic>>();
      });
    }

    // Add dummy devices for testing
    setState(() {
      connectedDevices = [
        {'id': '00:11:22:33:44:55', 'name': 'Dummy Device 1'},
        {'id': '66:77:88:99:AA:BB', 'name': 'Dummy Device 2'},
        {'id': 'CC:DD:EE:FF:00:11', 'name': 'Dummy Device 3'},
      ];
    });
  }

  Future<void> saveConnectedDevices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedDevices = jsonEncode(connectedDevices);
    prefs.setString(connectedDevicesKey, encodedDevices);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Perangkat'),
      ),
      body: Column(
        children: [
          // Tampilkan perangkat yang pernah terhubung
          FutureBuilder(
            future: loadConnectedDevices(),
            builder: (context, snapshot) {
              return Expanded(
                child: ListView.builder(
                  itemCount: connectedDevices.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> device = connectedDevices[index];
                    return DeviceTile(
                      deviceName: device['name'],
                      onTap: () async {
                        // Connect to a previously connected device
                        String deviceId = device['id'];
                        ScanResult? scanResult = devices.cast<ScanResult?>().firstWhere(
                              (result) => result?.device.id.toString() == deviceId,
                              orElse: () => null,
                            );

                        if (scanResult != null) {
                          await scanResult.device.connect();
                          saveConnectedDevices();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Device not found in scan results')),
                          );
                        }
                      },
                    );
                  },
                ),
              );
            },
          ),
          // Tampilkan perangkat yang baru ditemukan
          Expanded(
            child: StreamBuilder<List<ScanResult>>(
              stream: flutterBlue.scanResults,
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, index) {
                    ScanResult device = snapshot.data![index];
                    return DeviceTile(
                      deviceName: device.device.name,
                      onTap: () async {
                        // Connect to a newly discovered device
                        await device.device.connect();
                        connectedDevices.add({
                          'id': device.device.id.toString(),
                          'name': device.device.name
                        });
                        saveConnectedDevices();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Dashboard()),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: requestLocationPermissionAndScan,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text('Refresh List', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

class DeviceTile extends StatelessWidget {
  final String deviceName;
  final VoidCallback onTap;

  const DeviceTile({required this.deviceName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        leading: Icon(Icons.bluetooth),
        title: Text(deviceName),
        onTap: onTap,
      ),
    );
  }
}
