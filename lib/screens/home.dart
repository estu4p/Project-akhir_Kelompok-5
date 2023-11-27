import 'package:flutter/material.dart';
import 'package:projekakhir_teori/screens/station_page.dart';
import 'package:projekakhir_teori/screens/currency_converter.dart';
import 'package:projekakhir_teori/screens/askes_kamera.dart';
import 'package:projekakhir_teori/screens/login.dart';
import 'package:projekakhir_teori/screens/profile.dart';
// import 'package:projekakhir_teori/screens/stasiun_list.dart';
import 'package:projekakhir_teori/screens/time_converter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            // Konten untuk Stasiun (Index 0)
            const StationPage(),
            // Konten untuk Mata Uang (Index 1)
            const CurrencyConverterScreen(),
            // Konten untuk Waktu (Index 2)
            TimeConverterScreen(),
            // Konten Akses Kamera (Index 4)
            const AccessImage(),
            // Konten untuk Profil (Index 3)
            const Profile(),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            if (index == 5) {
              _logOut(context);
            } else {
              setState(() {
                _currentIndex = index;
              });
            }
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.train),
                label: 'Stasiun',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
              icon: Icon(Icons.monetization_on),
              label: 'Mata Uang',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: 'Waktu',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt),
                label: 'Akses Kamera',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profil',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout),
                label: 'Log Out',
                backgroundColor: Colors.blue),
          ],
        ),
      ),
    );
  }

  void _logOut(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
