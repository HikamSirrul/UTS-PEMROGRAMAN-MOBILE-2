import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:galery/search_screen.dart';
import 'history_screen.dart';
import 'profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  final List<Map<String, String>> loginHistory;

  const DashboardScreen({super.key, required this.loginHistory});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, String>> _items = [
    {"name": "Nature", "image": "https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"name": "Mountain", "image": "https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg"},
    {"name": "Forest", "image": "https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"},
    {"name": "Beach", "image": "https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg"},
  ];

  void _onItemTapped(int index) {
    if (!mounted) return; 
    setState(() {
      _selectedIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HistoryScreen(
              loginHistory: widget.loginHistory,
              selectedIndex: index,
              onItemTapped: _onItemTapped,
            ),
          ),
        );
      } else if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileScreen(
              email: 'evosgepeng', 
            ),
          ),
        );
      }
    });
  }

  void _slideToPrevious() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _slideToNext() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 243, 245, 247),
        automaticallyImplyLeading: false,
         actions: [
          IconButton(
            icon: const Icon(Icons.search),
            iconSize: 50,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(items: _items),
                ),
              );
            },
          ),
        ],
      ),
     body: SingleChildScrollView(
  child: Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: Colors.white, 
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        

                
                SizedBox(
                  height: 250,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                     
                      PageView(
                        controller: _pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildImagePage(
                              'https://images.pexels.com/photos/38136/pexels-photo-38136.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          _buildImagePage(
                              'https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          _buildImagePage(
                              'https://images.pexels.com/photos/221471/pexels-photo-221471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ],
                      ),

                      Positioned(
                        left: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: _slideToPrevious,
                        ),
                      ),

                    
                      Positioned(
                        right: 10,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: _slideToNext,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

               
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Color.fromARGB(255, 100, 88, 88),
                    dotColor: Colors.grey,
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildListViewItem('Nature',
                          'https://images.pexels.com/photos/1420440/pexels-photo-1420440.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildListViewItem('Mountain',
                          'https://images.pexels.com/photos/417173/pexels-photo-417173.jpeg'),
                      _buildListViewItem('Forest',
                          'https://images.pexels.com/photos/1671325/pexels-photo-1671325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildListViewItem('Beach',
                          'https://images.pexels.com/photos/457882/pexels-photo-457882.jpeg'),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                SizedBox(
                  height: 490,
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0,
                    childAspectRatio: 1.2,
                    children: [
                      _buildGridItem(
                          'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildGridItem(
                          'https://images.pexels.com/photos/4784349/pexels-photo-4784349.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildGridItem(
                          'https://images.pexels.com/photos/673020/pexels-photo-673020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildGridItem(
                          'https://images.pexels.com/photos/2476685/pexels-photo-2476685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildGridItem(
                          'https://images.pexels.com/photos/457881/pexels-photo-457881.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      _buildGridItem(
                          'https://images.pexels.com/photos/927414/pexels-photo-927414.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                    ],
                  ),
                ),
              ],
            ),
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

  Widget _buildImagePage(String imagePath) {
    return GestureDetector(
      onTap: () {
      
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 20,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      ),
    );
  }

  Widget _buildListViewItem(String text, String imageUrl) {
    return GestureDetector(
      onTap: () {

      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 140,
        margin: const EdgeInsets.only(right: 15, bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String imageUrl) {
    return GestureDetector(
      onTap: () {
       
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover, 
            width: double
                .infinity, 
            height: double
                .infinity, 
          ),
        ),
      ),
    );
  }
}
