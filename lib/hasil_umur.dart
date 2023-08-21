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
    DateTime adjustedBirthDate = DateTime(birthDate.year + years, birthDate.month, birthDate.day);

    int months = 0;
    int days = 0;

    if (adjustedBirthDate.isBefore(DateTime.now())) {
      while (adjustedBirthDate.add(Duration(days: _daysInMonth(adjustedBirthDate.month, adjustedBirthDate.year))).isBefore(DateTime.now())) {
        adjustedBirthDate = DateTime(adjustedBirthDate.year, adjustedBirthDate.month + 1, adjustedBirthDate.day);
        months++;
      }
    } else {
      while (adjustedBirthDate.isAfter(DateTime.now())) {
        adjustedBirthDate = DateTime(adjustedBirthDate.year, adjustedBirthDate.month - 1, adjustedBirthDate.day);
        months--;
      }
    }

    days = DateTime.now().difference(adjustedBirthDate).inDays;
    int hours = duration.inHours % 24;
    int minutes = duration.inMinutes % 60;

    String formattedDuration = '';

    if (years > 0) {
      formattedDuration += '$years Tahun\n';
    }
    if (months.abs() > 0) {
      formattedDuration += '${months.abs()} Bulan\n';
    }
    if (days.abs() > 0) {
      formattedDuration += '${days.abs()} Hari\n';
    }
    if (hours > 0) {
      formattedDuration += '$hours Jam\n';
    }
    if (minutes > 0) {
      formattedDuration += '$minutes Menit\n';
    }

    return formattedDuration.trim();
  }

  int _daysInMonth(int month, int year) {
    if (month == 2) {
      return _isLeapYear(year) ? 29 : 28;
    }
    if ([4, 6, 9, 11].contains(month)) {
      return 30;
    }
    return 31;
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
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
