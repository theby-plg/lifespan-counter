import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HasilUmurPage extends StatelessWidget {
  final String ageResult;
  final DateTime birthDate;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  HasilUmurPage({required this.ageResult, required this.birthDate});

  String _formatDuration(Duration duration) {
    int years = duration.inDays ~/ 365;
    int months = (duration.inDays % 365) ~/ 30;
    int days = duration.inDays % 30;
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;

    String formattedDuration = '';

    if (years > 0) {
      formattedDuration += '$years Tahun\n';
    }
    if (months > 0) {
      formattedDuration += '$months Bulan\n';
    }
    if (days > 0) {
      formattedDuration += '$days Hari\n';
    }
    if (hours > 0) {
      formattedDuration += '$hours Jam\n';
    }
    if (minutes > 0) {
      formattedDuration += '$minutes Menit\n';
    }

    return formattedDuration.trim();
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('id_ID', null);
    DateTime now = DateTime.now();
    Duration duration = now.difference(birthDate);

    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Umur Kamu Sekarang')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.purple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, // Mengatur rata tengah
            children: [
              // ignore: prefer_const_constructors
              Text('Umur Kamu adalah:', style: TextStyle(fontSize: 20, color: Colors.white)),
              // ignore: prefer_const_constructors
              SizedBox(height: 10),
              Text(
                _formatDuration(duration),
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Text(
                'Kamu Lahir Di Hari: ${DateFormat('EEEEEEE', 'id_ID').format(birthDate)}',
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                // ignore: deprecated_member_use
                style: ElevatedButton.styleFrom(primary: Colors.blue.shade700),
                // ignore: prefer_const_constructors
                child: Text('Kembali', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
