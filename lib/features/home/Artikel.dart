import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class ArtikelDetail extends StatelessWidget {

  final String? title, image;
  const ArtikelDetail({super.key, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel Perternakan'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    SizedBox(
                        width: 150,
                        child: AspectRatio(
                          aspectRatio: 4 / 3,
                          child: FancyShimmerImage(
                              boxFit: BoxFit.cover,
                              imageUrl:
                                 'https://cdn1.katadata.co.id/media/images/thumb/2023/11/15/El_Nino_Adalah_Fenomena_Iklim-2023_11_15-14_11_46_a594a843bdb48bc8c3bd8fb2b8480a50_960x640_thumb.jpg'),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Text(
                      'Mengatasi Tantangan Iklim Terkait Fenomena El Niño dalam Industri Peternakan di Indonesia',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
