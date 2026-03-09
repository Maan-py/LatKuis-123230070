import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';

class MovieListPage extends StatelessWidget {
  final String nama;
  const MovieListPage({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    /*
      implementasikan widget untuk menampilkan list movie yang sudah diambil dari dummy data
        - gunakan ListView.builder untuk menampilkan list movie
        - setiap item movie ditampilkan menggunakan Card widget yang berisi judul movie dan poster movie
        - ketika item movie ditekan, navigasikan ke halaman MovieDetailPage dengan membawa data movie yang dipilih
        
    
     */
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Halo $nama, selamat menonton film!",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                movieList[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${movieList[index].year} | ${movieList[index].genre}"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text("${movieList[index].rating}"),
                    ],
                  ),
                ],
              ),
              leading: Image.network(
                movieList[index].imgUrl,
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
