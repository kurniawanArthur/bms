import 'package:bms_jayajayajaya/utility/colors.dart';
import 'package:flutter/material.dart';
import 'tuning.dart';
import 'statistics.dart';
import 'menu.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    DashboardPage(),
    Tuning(),
    Statistics(),
    Menu(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            _selectedIndex == 0
                ? Icons.dashboard
                : _selectedIndex == 1
                    ? Icons.tune
                    : _selectedIndex == 2
                        ? Icons.show_chart
                        : Icons.menu,
          ),
          onPressed: () {},
        ),
        title: Text(
          _selectedIndex == 0
              ? 'Dashboard'
              : _selectedIndex == 1
                  ? 'Tuning'
                  : _selectedIndex == 2
                      ? 'Statistics'
                      : 'Menu',
        ),
      ),
      backgroundColor:Color(0xFFF1F3F7),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tune),
            label: 'Tuning',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 23, 60, 113),
        onTap: _onItemTapped,
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Card(
            color: Colors.white,
            margin: EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: "80% - Idle",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: "\n8h 15m remaining",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontFamily: "Inter",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  CircularPercentIndicator(
                    reverse: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    backgroundWidth: 15,
                    backgroundColor: Colors.white,
                    radius: 50.0,
                    lineWidth: 10.0,
                    percent: 0.8,
                    center: Icon(
                      Icons.electric_bolt_rounded,
                      size: 40,
                    ),
                    progressColor: AppColors.primary,
                  ),
                  SizedBox(height: 5,),
                  Text("Last charge was 7 hours ago", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),)
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                _buildDashboardItem('3500 mAh', 'Amperage', Icons.bolt),
                _buildDashboardItem('Good', 'Battery Health', Icons.health_and_safety),
                _buildDashboardItem('46V', 'Voltage', Icons.electrical_services),
                _buildDashboardItem('120°C', 'Temperature', Icons.thermostat),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem(String value, String label, IconData icon) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 30),
            Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(label),
          ],
        ),
      ),
    );
  }
}
