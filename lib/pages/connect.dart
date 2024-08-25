import 'package:flutter/material.dart';
import 'bluetooth_list.dart';
import 'package:bms_jayajayajaya/utility/colors.dart';

class Connect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.bluetooth_disabled_rounded, color: Colors.black54,size: 50,),
            SizedBox(height: 10,),
            RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome, Buddy!',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "\nThe battery is not detected,\nplease turn on your bluetooth",
                            style: TextStyle(fontSize: 20,color: Colors.black54)
                            )
                        ],
                      ),
                    ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BluetoothList()),
                );
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(200, 40),
                backgroundColor: AppColors.primary
              ),
              child: Text('Connect to Battery',style: TextStyle(color: Colors.white, fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}
