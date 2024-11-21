import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Pastikan untuk mengimpor DashboardScreen
import 'history_screen.dart'; // Pastikan untuk mengimpor HistoryScreen
import 'login_screen.dart'; // Pastikan untuk mengimpor LoginScreen

class ProfileScreen extends StatefulWidget {
  final String email;

  const ProfileScreen({super.key, required this.email});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 2; // Index untuk menunjukkan halaman Profile

  void _onItemTapped(int index) {
    if (index == _selectedIndex) return; // Jangan lakukan apa-apa jika halaman sama

    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan index
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(loginHistory: []), // Ganti dengan data loginHistory
        ),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HistoryScreen(
            loginHistory: [], // Ganti dengan data loginHistory
            selectedIndex: 1,
            onItemTapped: _onItemTapped,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 245, 247),
        automaticallyImplyLeading: false,
         actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 214, 0, 0),
            ),
            iconSize: 40,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
          ),
        ],
      ),
     body: Container(
  width: double.infinity,
  color: Colors.white, // Ubah background menjadi warna putih
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: NetworkImage(
            'https://cdn-icons-png.flaticon.com/128/1999/1999625.png',
          ),
          backgroundColor: Colors.transparent,
        ),
        const SizedBox(height: 20),
        const Text(
          'Hikam Sirrul Arifin',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Pastikan teks terlihat jelas di latar belakang putih
          ),
        ),
              const SizedBox(height: 10),
              Text(
                widget.email, // Tampilkan email pengguna
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
             
               
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey[600],
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
