import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
import 'package:galery/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // List to store login history
  List<Map<String, String>> loginHistory = [];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Function to handle login
  void _login() {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      // Check email and password
      if (email == 'evosgepeng' && password == 'admin123') {
        // Add to login history, include the email
        setState(() {
          loginHistory.add({
            'email': email, // Simpan email yang berhasil login
            'time': DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()), // Format tanggal dan waktu
            'status': 'Success'
          });
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(loginHistory: loginHistory),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username atau password salah.')),
        );
        // Add to login history as failed attempt
        setState(() {
          loginHistory.add({
            'email': email, // Simpan email meskipun gagal login
            'time': DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()),
            'status': 'Failed'
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 108, 167, 234)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tambahkan gambar icon login dari URL
                  AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 1),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/2609/2609282.png',
                      height: 120,
                      width: 160,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome To My Galery',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please login to your account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Card login with shadow and rounded corners
                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            // Username Field
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                  labelText: 'Username',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: const Icon(Icons.email),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Username harus diisi';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Password Field
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child: TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  prefixIcon: const Icon(Icons.lock),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password harus diisi';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 25),

                            // Login Button with Animation
                            AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(255, 108, 167, 234),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 80,
                                    vertical: 15,
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
