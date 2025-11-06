import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png', height: 120),
              SizedBox(height: 20),
              Text(
                "Selamat Datang di BeritaKu Sepakbola",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text("Temukan berita, hasil, dan klasemen sepakbola terkini!"),
              SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Email / Username',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                ),
                onPressed: () {
                  if (usernameController.text.isEmpty || passwordController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Username dan Password harus diisi!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  }
                },
                child: Text("Masuk", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}