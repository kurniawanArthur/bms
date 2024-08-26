import 'package:flutter/material.dart';

class Tuning extends StatefulWidget {
  @override
  _TuningState createState() => _TuningState();
}

class _TuningState extends State<Tuning> {
  double dischargeCurrent = 30;
  double temperatureCutoff = 67;
  double voltageCutoff = 31;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Tuning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: 'Low threshold',
              items: <String>['Low threshold', 'Medium threshold', 'High threshold']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(height: 16),
            _buildSlider(
              title: 'Max. discharge current (A)',
              value: dischargeCurrent,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  dischargeCurrent = value;
                });
              },
            ),
            _buildSlider(
              title: 'Temperature cut-off (C)',
              value: temperatureCutoff,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  temperatureCutoff = value;
                });
              },
            ),
            _buildSlider(
              title: 'Voltage cut-off (V)',
              value: voltageCutoff,
              min: 0,
              max: 100,
              onChanged: (double value) {
                setState(() {
                  voltageCutoff = value;
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    // Edit action
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Save action
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String title,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: 100,
            label: value.round().toString(),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
