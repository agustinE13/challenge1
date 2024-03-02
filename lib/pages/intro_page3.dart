import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(142, 36, 170, 1),
            Color.fromRGBO(156, 39, 176, 1),
            Color.fromRGBO(171, 71, 188, 1),
            Color.fromRGBO(100, 181, 246, 1),
            Color.fromRGBO(66, 165, 245, 1),
            Color.fromRGBO(21, 101, 192, 1),
          ],
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
                  "Speed and adrenaline await you! Models with speeds never seen before. Feel freedom in every turn with our app",
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
                  "https://lottie.host/e5f662a5-20a9-4318-bf38-ffaceb83ba05/WKl3tF1N8M.json"),
            ),
          ),
        ],
      ),
    );
  }
}
