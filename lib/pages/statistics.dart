import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          "Statistics",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Chart Section
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: LineChartWidget(),
              ),
            ),
            SizedBox(height: 16),
            // Progress Bars Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        children: [
                          ProgressBar(label: "1", value: 0.33, max: 72, current: 24, color: Colors.red),
                          ProgressBar(label: "2", value: 0.66, max: 72, current: 48, color: Colors.green),
                          ProgressBar(label: "3", value: 0.50, max: 72, current: 36, color: Colors.yellow),
                          ProgressBar(label: "4", value: 0.75, max: 72, current: 54, color: Colors.green),
                          ProgressBar(label: "5", value: 0.40, max: 72, current: 29, color: Colors.yellow),
                          ProgressBar(label: "6", value: 0.60, max: 72, current: 43, color: Colors.green),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.show_chart),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: '',
      //     ),
      //   ],
      //   currentIndex: 1,
      //   selectedItemColor: Colors.green,
      //   onTap: (int index) {
      //     // Handle tap here
      //   },
      // ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace with actual chart widget
    return Center(
      child: Text(
        "Line Chart Here",
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final String label;
  final double value;
  final int max;
  final int current;
  final Color color;

  const ProgressBar({
    required this.label,
    required this.value,
    required this.max,
    required this.current,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label),
          SizedBox(width: 8),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 16,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 16,
                  width: MediaQuery.of(context).size.width * value,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Text(
                      '$current/$max',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
