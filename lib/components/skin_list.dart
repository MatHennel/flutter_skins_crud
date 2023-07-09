import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SkinListScreen extends StatelessWidget {
  final List<String> skinUrls;
  final double imageWidth = 200.0; // Defina a largura desejada para as imagens

  SkinListScreen({required this.skinUrls});

  @override
  Widget build(BuildContext context) {
    double imageHeight =
        imageWidth / 1.5; // Calcule a altura proporcional à largura

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Skins'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        color: Colors.black, // Define a cor de fundo preto
        child: ListView(
          children: skinUrls.map((url) {
            return Container(
              width: imageWidth,
              height: imageHeight,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors
                    .white, // Define a cor de fundo branca para cada imagem
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Aqui você pode adicionar a lógica para selecionar a skin
                  // e retornar o resultado para a tela anterior
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
