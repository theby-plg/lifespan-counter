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

  Widget _buildNumberButton(int number) {
    bool isSelected = _userNumber == number;
    Color buttonColor = isSelected ? Colors.green : Colors.deepOrange;

    return GestureDetector(
      onTap: () {
        setState(() {
          _userNumber = number;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          number.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceButton(String choice) {
    bool isSelected = _tahunUlangTahun == choice;
    Color buttonColor = isSelected ? Colors.blue : Colors.blueGrey;

    return GestureDetector(
      onTap: () {
        setState(() {
          _tahunUlangTahun = choice;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          choice,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(9, (index) {
                return _buildNumberButton(index + 1);
              }),
            ),
            SizedBox(height: 20),
            Text('Di tahun 2023 ini, apakah kamu sudah ulang tahun?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildChoiceButton("Sudah"),
                SizedBox(width: 10),
                _buildChoiceButton("Belum"),
              ],
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
