import 'dart:ui';

import 'package:challenge_app/models/motos.dart';
import 'package:flutter/material.dart';

final listCategory = ['Sport', 'Dual','Scooter'];
final listMotos = [
 
  Motos(
    'BMW M 1000 R 2023',
    'Moto Sport',
    '\$507,500.00',
    5,
    [
      ImageMotos(
        'assets/sport/sport1.png',
        const Color.fromARGB(255, 22, 110, 199),
      ),
      ImageMotos(
        'assets/sport/sport2.png',
        const Color(0xFF000000),
      )
    ],
    'Push yourself to the limit with the M 1000 R. 210 HP with 280 km/h top speed under your control, on the road or the track.'
  ),
  Motos(
    'KTM 690 ENDURO R',
    'Dual Sport',
    '\$15,652.00',
    4,
    [
      ImageMotos(
        'assets/sport/dual1.png',
        Color.fromARGB(255, 252, 227, 0),
      ),
      ImageMotos(
        'assets/sport/dual2.png',
        Color.fromARGB(255, 248, 149, 1),
      ),
      ImageMotos(
        'assets/sport/dual3.png',
        Color.fromARGB(255, 91, 239, 5),
      )
    ],'Widely appreciated for its 250-like agility and 450-like power, the KTM 350 EXC-F has earned a reputation for its versatility.'
  ),
  Motos(
    'HONDA FORZA 125',
    'Moto Scooter',
    '\$98,770.73',
    4,
    [
      ImageMotos(
        'assets/sport/honda1.png',
        Color.fromARGB(168, 217, 40, 40),
      ),
      ImageMotos(
        'assets/sport/honda2.png',
        Color.fromARGB(255, 2, 86, 255),
      ),
      ImageMotos(
        'assets/sport/honda3.png',
        Color.fromARGB(255, 0, 0, 0),
      )
    ],'The upgraded Smart Power Plus delivers a maximum power of 10.7 kW (15 HP) with a torque of 12.3 Nm, an output that provides good top speed and acceleration in the city.'
  ),
];
