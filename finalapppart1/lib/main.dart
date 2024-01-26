import 'package:flutter/material.dart';
import 'about_page.dart';
import 'storage_service.dart';
import 'jokes_list_page.dart'; 


void main() {
  runApp(MyApp());
  StorageService().saveCredentials('admin', 'paSSw0rd');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokester',
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final StorageService _storageService = StorageService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jokester',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Jokerman',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Please sign in',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20), 
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  SizedBox(height: 20), 
                  ElevatedButton(
                    onPressed: _login,
                    child: Text('Sign In'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 1,
            bottom: 1,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
              child: Text('About'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
          ),
          Positioned(
            right: 18,
            bottom: 18,
            child: Text('Version 1.0.2'),
          ),
        ],
      ),
    );
  }
  void _login() async {
  Map<String, String>? credentials = await _storageService.getCredentials();

  if (credentials != null &&
      _usernameController.text == credentials['username'] &&
      _passwordController.text == credentials['password']) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login success')),
    );
    Navigator.of(context).pushReplacement( 
      MaterialPageRoute(builder: (context) => JokesListPage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid username or password')),
    );
  }
}

}
