import 'package:flutter/material.dart';

class Tuning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Temperature Cut-off'),
        Slider(
          value: 50,
          min: 0,
          max: 100,
          divisions: 10,
          label: '50',
          onChanged: (double value) {},
        ),
        Text('Voltage Cut-off'),
        Slider(
          value: 12,
          min: 0,
          max: 24,
          divisions: 12,
          label: '12',
          onChanged: (double value) {},
        ),
        Text('Current Cut-off'),
        Slider(
          value: 10,
          min: 0,
          max: 20,
          divisions: 10,
          label: '10',
          onChanged: (double value) {},
        ),
      ],
    );
  }
}
