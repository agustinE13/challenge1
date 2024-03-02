import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(156, 39, 176, 1),
            Color.fromRGBO(142, 36, 170, 1),
            Color.fromRGBO(123, 31, 162, 1),
            Color.fromRGBO(106, 27, 154, 1),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            top:
                150, // Ajusta este valor según la cantidad de espacio que desees arriba del borde superior
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        20), // Ajusta el espacio horizontal alrededor del texto
                child: Text(
                  "Be part of the best accessories for motorcyclists, dominate the asphalt",
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
                  "https://lottie.host/2d6a3005-f336-4b5a-81a2-618d1a584c48/hDbJXI9iPn.json"),
            ),
          ),
        ],
      ),
    );
  }
}
