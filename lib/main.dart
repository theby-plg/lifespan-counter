import 'package:flutter/material.dart';
import 'hitung_umur.dart';
import 'tebakumur.dart'; // Impor file tebakumur.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lifespan Counter',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
      routes: {
        '/hitungUmur': (context) => HitungUmurPage(),
        '/tebakUmur': (context) => TebakUmurPage(), // Tambahkan rute untuk tebakUmur
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lifespan Counter')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/hitungUmur');
              },
              child: const Text('Hitung Umur'),
            ),
            SizedBox(width: 20), // Memberikan jarak antara tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tebakUmur'); // Tambahkan navigasi ke halaman tebakUmur
              },
              child: const Text('Tebak Umur'),
            ),
          ],
        ),
      ),
    );
  }
}
