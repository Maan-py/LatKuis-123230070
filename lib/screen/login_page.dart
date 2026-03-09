import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/moviel_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoggedIn = false;

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    if (username == "070" && password == "070") {
      isLoggedIn = true;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MovieListPage()),
      );
    } else {
      isLoggedIn = false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Login Gagal! Username atau Password Salah!",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    /*
      buatlah tampilan login sederhana dengan menggunakan widget TextField untuk input username dan password, serta ElevatedButton untuk tombol login.
      - TextField untuk username dengan hint text "Username"
      - TextField untuk password dengan hint text "Password" dan obscureText true
      - ElevatedButton dengan text "Login" yang ketika ditekan akan menampilkan snackbar dengan pesan
        "Login berhasil" jika username dan password tidak kosong, atau "Login gagal" jika salah satu atau kedua field kosong.
      - jika login berhasil, navigasikan ke halaman MovieListPage (buat halaman MovieListPage 
     */
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _usernameField(_usernameController),
                SizedBox(height: 10),
                _passwordField(_passwordController),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 40)),
                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Username",
    ),
    controller: controller,
  );
}

Widget _passwordField(TextEditingController controller) {
  return TextField(
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Password",
    ),
    obscureText: true,
    controller: controller,
  );
}
