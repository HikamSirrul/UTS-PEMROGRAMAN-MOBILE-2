import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> loginHistory;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const HistoryScreen({
    super.key,
    required this.loginHistory,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text(
          'Login History',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 245, 247),
        automaticallyImplyLeading: false,
      ),
     body: Container(
  width: double.infinity,
  color: Colors.white, // Ubah background menjadi putih
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        const Text(
          'Your Login History',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Pastikan teks terlihat jelas di atas latar putih
          ),
        ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: loginHistory.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Icon(
                          loginHistory[index]['status'] == 'Success'
                              ? Icons.check_circle
                              : Icons.error,
                          color: loginHistory[index]['status'] == 'Success'
                              ? Colors.green
                              : Colors.red,
                          size: 30,
                        ),
                        title: Text(
                          '${loginHistory[index]['email']} - ${loginHistory[index]['time']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        subtitle: Text(
                          'Status: ${loginHistory[index]['status']}',
                          style: TextStyle(
                            fontSize: 14,
                            color: loginHistory[index]['status'] == 'Success'
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -4),
              blurRadius: 6,
            ),
          ],
        ),
        child: BottomNavigationBar(
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
          currentIndex: selectedIndex,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(
                    loginHistory: loginHistory, // Pass loginHistory to DashboardScreen
                  ),
                ),
              );
            } else {
              onItemTapped(index); // Navigate to other pages if not Home
            }
          },
        ),
      ),
    );
  }
}
Widget _buildPageViewItem(String text, Color color, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Implement the onTap behavior here
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItem(String text, Color color, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Implement the onTap behavior here
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 140,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 35, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String text, Color color, IconData icon) {
    return GestureDetector(
      onTap: () {
        // Implement the onTap behavior here
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50, color: Colors.white),
              const SizedBox(height: 10),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  


