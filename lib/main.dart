import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/screen/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Login Page"),
        //   backgroundColor: Colors.blue,
        //   foregroundColor: Colors.white,
        // ),
        // body: Center(
        //   child: Padding(
        //     padding: const EdgeInsets.all(12.0),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         TextField(
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             hintText: "Username",
        //           ),
        //         ),
        //         SizedBox(height: 10),
        //         TextField(
        //           decoration: InputDecoration(
        //             border: OutlineInputBorder(),
        //             hintText: "Password",
        //           ),
        //         ),
        //         SizedBox(height: 10),
        //         ElevatedButton(
        //           onPressed: () {},
        //           style: ElevatedButton.styleFrom(minimumSize: Size(200, 40)),
        //           child: Text("Login"),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        body: LoginPage(),
      ),
    );
  }
}
