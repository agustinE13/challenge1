import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color.fromRGBO(38, 198, 218, 1),
        Color.fromRGBO(0, 188, 212, 1),
        Color.fromRGBO(0, 172, 193, 1),
        Color.fromRGBO(77, 208, 225, 1),
        Color.fromRGBO(0, 131, 143, 1),
      ],
    ),
  ),
  child: Stack(
    children: [
      const Positioned(
        top: 150, // Ajusta este valor según la cantidad de espacio que desees arriba del borde superior
        left: 0,
        right: 0,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), // Ajusta el espacio horizontal alrededor del texto
            child: Text(
              "Explore, connect and share your passion for motorbikes by finding your ideal motorbikes",
              softWrap: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Lottie.network(
            "https://lottie.host/285848b1-1bbf-4146-8800-497f1cab9c97/ljlYQ7mI8K.json",
          ),
        ),
      ),
    ],
  ),
);



  }
}
