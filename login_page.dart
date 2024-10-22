// lib/login_page.dart
import 'package:flutter/material.dart';
import 'catalog_page.dart'; // Import your catalog page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Static username and password
    const String username = 'admin';
    const String password = 'admin';

    if (_usernameController.text == username &&
        _passwordController.text == password) {
      // Navigate to catalog page on successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => CatalogPage()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MANCHESTER UNITED SHOP'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/hif/f/ff/Manchester_United_FC_crest.png',
              width: 100,
              height: 100,
            ),
            SizedBox(height: 5),
            Text(
              'LOG IN',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 20),

            // Username label and TextField
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align label and TextField to the left
              children: [
                Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 14, // Smaller font size for the label
                      color: Colors.black, // Optional: change color to black
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Add a border if needed
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Password label and TextField
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Align label and TextField to the left
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                      fontSize: 14, // Smaller font size for the label
                      color: Colors.black, // Optional: change color to black
                      fontWeight:
                          FontWeight.bold // Optional: change color to black
                      ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(), // Add a border if needed
                  ),
                  obscureText: true,
                ),
              ],
            ),
            SizedBox(height: 20),
            // Container to make the button the same width as the TextField
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white), // Change text color to white
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(
                      255, 223, 17, 2), // Set button background color to red
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
