import 'package:flutter/material.dart';

class StatistikScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistik Peternakan'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/icons/date.png', width: 32, height: 32),
                title: Text('Tanggal', style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),),
                subtitle: Text('21 Mei 2024 - 21 Mei 2024', style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),),
              ),
            ),
            SizedBox(height: 14.0),
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/icons/pie_chart.png', width: 32, height: 32),
                title: Text('Kavling Wonosalam',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                subtitle: Text('Populasi : 294 ekor',style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal)),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Jenis Kelamin', style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
              child: Column(
                children: [
                  ListTile(
                   leading: Image.asset('assets/images/icons/male_sign.png', width: 24, height: 24),
                    title: Text('Jantan',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Text('1 Ekor'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/icons/female_sign.png', width: 24, height: 24),
                    title: Text('Betina',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Text('293 Ekor'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text('Jumlah Kasus Sakit', style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
              child: ListTile(
                leading: Image.asset('assets/images/icons/sick.png', width: 24, height: 24),
                title: Text('Kasus Sakit',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                trailing: Text('0 Kasus'),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Struktur Populasi', style: TextStyle(fontWeight: FontWeight.bold)),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset('assets/images/icons/cow_mono.png', width: 24, height: 24),
                    title: Text('Bakalan',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Text('278 Ekor'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/icons/cow_mono.png', width: 24, height: 24),
                    title: Text('Hamil',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Text('1 Ekor'),
                  ),
                  ListTile(
                    leading: Image.asset('assets/images/icons/cow_mono.png', width: 24, height: 24),
                    title: Text('Induk',style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
                    trailing: Text('6 Ekor'),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
