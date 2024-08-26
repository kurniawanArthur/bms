import 'package:flutter/material.dart';
import 'tuning.dart';
import 'statistics.dart';
import 'menu.dart';

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
        selectedItemColor: Colors.amber[800],
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
            child: ListTile(
              leading: Icon(Icons.battery_charging_full, size: 50),
              title: Text('80% - Idle'),
              subtitle: Text('8 h 15 m remaining'),
            ),
          ),
          SizedBox(height: 10),
          Card(
            child: ListTile(
              leading: Icon(Icons.flash_on, size: 50),
              title: Text('Last charge was 7 h ago'),
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

// class Tuning extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Tuning Content'),
//     );
//   }
// }

// class Statistics extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Statistics Content'),
//     );
//   }
// }

// class Menu extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text('Menu Content'),
//     );
//   }
// }
