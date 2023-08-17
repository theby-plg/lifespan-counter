import 'package:flutter/material.dart';

class HasilTebakUmurPage extends StatefulWidget {
  final int result;

  HasilTebakUmurPage({required this.result});

  @override
  _HasilTebakUmurPageState createState() => _HasilTebakUmurPageState();
}

class _HasilTebakUmurPageState extends State<HasilTebakUmurPage> {
  int _tahunKelahiran = 0;
  int _hasilAkhir = 0;

  void _calculateFinalResult() {
    _hasilAkhir = widget.result - _tahunKelahiran;
    _hasilAkhir %= 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hasil Tebak Umur')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Masukkan 4 digit tahun kelahiran Anda:'),
            SizedBox(height: 10),
            Container(
              width: 100,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                onChanged: (value) {
                  setState(() {
                    _tahunKelahiran = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateFinalResult();
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Text('Umur Anda Sekarang: $_hasilAkhir'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Tebak Umur'),
            ),
          ],
        ),
      ),
    );
  }
}
