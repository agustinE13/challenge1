import 'package:challenge_app/pages/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      logo: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/sport/portada3.png',
          fit: BoxFit.cover, // Para asegurarse de que la imagen cubra toda la pantalla
        ),
      ),
      done: Done(
        LoginScreen(),
        animationDuration: const Duration(milliseconds: 3000),
      ),
    );
  }
}
