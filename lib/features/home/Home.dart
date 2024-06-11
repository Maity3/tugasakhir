import 'dart:convert';

import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:sobatternak_application/features/home/ArtikelDetail.dart';

class HomeScreen extends StatelessWidget {
  final String? title, image;
  const HomeScreen({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 400.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          AssetImage('assets/illustrations/bg_header_home.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0, // Adjust this value according to your requirement
                  left: 5.0, // Adjust this value according to your requirement
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/logos/logo p.png', // Replace with your icon asset
                              width: 40,
                              height: 40,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Catat kondisi ternakmu ya!\nTernak park Wonosalam',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 110.0,
                  right: 5.0, // Adjust this value according to your requirement
                  left: 5.0, // Adjust this value according to your requirement
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    alignment: Alignment.topLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/cage.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    SizedBox(
                                        width:
                                            4), // Jarak antara gambar dan teks
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Kavling Maity',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        Row(
                                          children: [
                                            Text('Total Populasi:',
                                                style: TextStyle(fontSize: 12)),
                                            Text(
                                              "data",
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      85, 35, 124, 0.923)),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color.fromARGB(
                                        255,
                                        254,
                                        254,
                                        254), // Ubah warna latar belakang tombol di sini
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          15), // Ubah ukuran tombol di sini
                                    ),
                                    minimumSize: Size(80,
                                        40), // Ubah ukuran minimum tombol di sini
                                  ),
                                  child: Text(
                                    'Ganti',
                                    style: TextStyle(
                                      fontSize: 12, // Ubah ukuran teks di sini
                                      color: Color.fromRGBO(85, 35, 124,
                                          0.923), // Ubah warna teks di sini
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/male_sign.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        SizedBox(
                                            width:
                                                4), // Beri jarak antara gambar dan teks
                                        Text('Jantan',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 2), // Beri jarak antara baris
                                    Text('6 Ekor',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width:
                                                20), // Beri jarak untuk menyesuaikan lebar gambar sebelumnya
                                        Image.asset(
                                          'assets/images/icons/female_sign.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        SizedBox(
                                            width:
                                                4), // Beri jarak antara gambar dan teks
                                        Text('Betina',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 2), // Beri jarak antara baris
                                    Text('3 Ekor',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width:
                                                20), // Beri jarak untuk menyesuaikan lebar gambar sebelumnya
                                        Image.asset(
                                          'assets/images/icons/market.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        SizedBox(
                                            width:
                                                4), // Beri jarak antara gambar dan teks
                                        Text('Siap Jual',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 14.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/images/icons/health.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        SizedBox(
                                            width:
                                                4), // Beri jarak antara gambar dan teks
                                        Text('Sehat',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 2), // Beri jarak antara baris
                                    Text('6 Ekor',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width:
                                                32), // Beri jarak untuk menyesuaikan lebar gambar sebelumnya
                                        Image.asset(
                                          'assets/images/icons/sick.png',
                                          width: 32,
                                          height: 32,
                                        ),
                                        SizedBox(
                                            width:
                                                4), // Beri jarak antara gambar dan teks
                                        Text('Sakit',
                                            style: TextStyle(fontSize: 14)),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 2), // Beri jarak antara baris
                                    Text('3 Ekor',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    // Tindakan yang akan dilakukan saat ikon diklik
                  },
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons/goat.png', // Ganti dengan path dari gambar ikon
                        width:
                            62, // Sesuaikan dengan lebar ikon yang diinginkan
                        height:
                            62, // Sesuaikan dengan tinggi ikon yang diinginkan
                      ),
                      SizedBox(height: 4), // Beri jarak antara ikon dan teks
                      Text('Hewan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.bold)), // Teks di bawah ikon
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Tindakan yang akan dilakukan saat ikon diklik
                  },
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons/cage.png', // Ganti dengan path dari gambar ikon
                        width:
                            62, // Sesuaikan dengan lebar ikon yang diinginkan
                        height:
                            62, // Sesuaikan dengan tinggi ikon yang diinginkan
                      ),
                      SizedBox(height: 4), // Beri jarak antara ikon dan teks
                      Text('Kandang',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.bold)), // Teks di bawah ikon
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Tindakan yang akan dilakukan saat ikon diklik
                  },
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons/health_menu.png', // Ganti dengan path dari gambar ikon
                        width:
                            62, // Sesuaikan dengan lebar ikon yang diinginkan
                        height:
                            62, // Sesuaikan dengan tinggi ikon yang diinginkan
                      ),
                      SizedBox(height: 4), // Beri jarak antara ikon dan teks
                      Text('Kesehatan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.bold)), // Teks di bawah ikon
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Tindakan yang akan dilakukan saat ikon diklik
                  },
                  icon: Column(
                    children: [
                      Image.asset(
                        'assets/images/icons/sack.png', // Ganti dengan path dari gambar ikon
                        width:
                            62, // Sesuaikan dengan lebar ikon yang diinginkan
                        height:
                            62, // Sesuaikan dengan tinggi ikon yang diinginkan
                      ),
                      SizedBox(height: 4), // Beri jarak antara ikon dan teks
                      Text('Pakan',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight:
                                  FontWeight.bold)), // Teks di bawah ikon
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // Menyusun widget secara horizontal dengan sebaris
                children: [
                  Text(
                    'Artikel Peternakan',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtikelDetail()),
                      ); // Tindakan yang akan dilakukan saat teks "Lihat Semua" diklik
                    },
                    child: Text(
                      'Lihat Semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(
                            85, 35, 124, 0.923), // Warna teks biru
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: AspectRatio(
                    aspectRatio: 4 / 3,
                    child: FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: image ?? '',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
