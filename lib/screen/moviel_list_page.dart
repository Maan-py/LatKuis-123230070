import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieListPage extends StatefulWidget {
  final String nama;
  const MovieListPage({super.key, required this.nama});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  bool isAdded = false;
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
          "Halo ${widget.nama}, selamat menonton film!",
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
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        movieList[index].isAdded = !movieList[index].isAdded;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(
                        color: movieList[index].isAdded
                            ? Colors.blue
                            : Colors.black,
                      ),
                      backgroundColor: movieList[index].isAdded
                          ? Colors.blue
                          : Colors.white,
                    ),
                    child: Text(
                      "Tambahkan ke Daftar",
                      style: TextStyle(
                        color: movieList[index].isAdded
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailPage(movie: movieList[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MovieDetailPage extends StatelessWidget {
  final MovieModel movie;
  const MovieDetailPage({super.key, required this.movie});

  Future<void> _launchWikipedia() async {
    final Uri uri = Uri.parse(movie.movieUrl);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      print("Gagal buka link");
    } else {
      print("Tombol ke ${movie.movieUrl} berhasil diklik");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(movie.imgUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text("${movie.year}"),
                  Text("Genre: ${movie.genre}"),
                  Text("Sutradara: ${movie.director}"),
                  Text("Pemeran: ${movie.casts.join(", ")}"),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text("${movie.rating}"),
                    ],
                  ),
                  Text(movie.synopsis),
                  ElevatedButton(
                    onPressed: _launchWikipedia,
                    child: Text("Ke Wikipedia"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
