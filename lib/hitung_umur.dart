import 'package:flutter/material.dart';
import 'hasil_umur.dart';

// ignore: use_key_in_widget_constructors
class HitungUmurPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HitungUmurPageState createState() => _HitungUmurPageState();
}

class _HitungUmurPageState extends State<HitungUmurPage> {
  DateTime _selectedDate = DateTime.now(); // Default selected date
  // ignore: prefer_final_fields
  TextEditingController _birthdateController = TextEditingController();
  String _ageResult = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _birthdateController.text = _selectedDate.toString().split(' ')[0];
      });
    }
  }

  void _calculateAge() {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - _selectedDate.year;

    if (currentDate.month < _selectedDate.month ||
        (currentDate.month == _selectedDate.month &&
            currentDate.day < _selectedDate.day)) {
      age--;
    }

    setState(() {
      _ageResult = age.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      appBar: AppBar(title: Text('Hitung Umur')),
      body: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _birthdateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Tanggal Lahir',
                suffixIcon: IconButton(
                  onPressed: () {
                    _selectDate(context);
                  },
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.calendar_today),
                ),
              ),
              onTap: () {
                _selectDate(context);
              },
            ),
            // ignore: prefer_const_constructors
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateAge();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HasilUmurPage(ageResult: _ageResult, birthDate: _selectedDate),
                  ),
                );
              },
              // ignore: prefer_const_constructors
              child: Text('Hitung Umur'),
            ),
          ],
        ),
      ),
    );
  }
}
