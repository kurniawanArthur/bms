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
            Icon(Icons.bluetooth_disabled_sharp, color: Colors.black54,size: 100,),
            SizedBox(height: 30,),
            RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Welcome, Buddy!',
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "\nThe battery is not detected,\nplease turn on your bluetooth",
                            style: TextStyle(fontSize: 18,color: Colors.black54, fontFamily: "Inter",)
                            )
                        ],
                      ),
                    ),
            SizedBox(height: 30),
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
