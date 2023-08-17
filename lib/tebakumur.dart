import 'package:flutter/material.dart';
import 'hasiltebakumur.dart'; // Import file hasiltebakumur.dart

class TebakUmurPage extends StatefulWidget {
  @override
  _TebakUmurPageState createState() => _TebakUmurPageState();
}

class _TebakUmurPageState extends State<TebakUmurPage> {
  int _userNumber = 1;
  String _tahunUlangTahun = "Belum";
  int _finalResult = 0;

  void _calculateResult() {
    int tempResult = (_userNumber * 2 + 5) * 50;
    if (_tahunUlangTahun == "Sudah") {
      tempResult += 1773;
    } else {
      tempResult += 1772;
    }
    _finalResult = tempResult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tebak Umur')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Pilih Angka Yang Kamu Inginkan:'),
            DropdownButton<int>(
              value: _userNumber,
              onChanged: (newValue) {
                setState(() {
                  _userNumber = newValue!;
                });
              },
              items: List.generate(9, (index) {
                return DropdownMenuItem<int>(
                  value: index + 1,
                  child: Text((index + 1).toString()),
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Di tahun 2023 ini , apa Kamu sudah ulang tahun?'),
            DropdownButton<String>(
              value: _tahunUlangTahun,
              onChanged: (newValue) {
                setState(() {
                  _tahunUlangTahun = newValue!;
                });
              },
              items: ["Belum", "Sudah"].map<DropdownMenuItem<String>>((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateResult();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HasilTebakUmurPage(result: _finalResult), // Mengirimkan hasil ke halaman HasilTebakUmurPage
                  ),
                );
              },
              child: Text('Hitung Umur'),
            ),
          ],
        ),
      ),
    );
  }
}
