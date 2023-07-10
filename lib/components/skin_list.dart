import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SkinListScreen extends StatelessWidget {
  final List<String> skinUrls;
  final double imageWidth = 200.0;

  SkinListScreen({required this.skinUrls});

  @override
  Widget build(BuildContext context) {
    double imageHeight = imageWidth / 1.5;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Skins'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          children: skinUrls.map((url) {
            return Container(
              width: imageWidth,
              height: imageHeight,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, url);
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
