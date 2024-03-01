import 'package:challenge_app/models/motos.dart';
import 'package:challenge_app/widgets/custom_button.dart';
import 'package:challenge_app/widgets/transition.dart';
import 'package:flutter/material.dart';

class DetailsMotorsPage extends StatefulWidget {
  const DetailsMotorsPage({Key? key, required this.motors}) : super(key: key);
  final Motos motors;

  @override
  State<DetailsMotorsPage> createState() => _DetailsMotorsPageState();
}

class _DetailsMotorsPageState extends State<DetailsMotorsPage> {
  int valueIndexColor = 0;
  int valueIndexSize = 1;
  bool isFavorited = false;
  late ThemeData themeData = Theme.of(context);

  double sizeMotors(int index, Size size) {
    switch (index) {
      case 0:
        return (size.height * 0.09);
      case 1:
        return (size.height * 0.07);
      case 2:
        return (size.height * 0.05);
      case 3:
        return (size.height * 0.04);
      default:
        return (size.height * 0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -size.height * 0.15,
              right: -size.height * 0.20,
              child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 250),
                  tween: Tween(begin: 0, end: 1),
                  builder: (context, value, __) {
                    return AnimatedContainer(
                      duration: const Duration(microseconds: 400),
                      height: value * size.height * 0.5,
                      width: value * size.height * 0.5,
                      decoration: BoxDecoration(
                        color: widget.motors.listImage[valueIndexColor].color,
                        shape: BoxShape.circle,
                      ),
                    );
                  })),
          Positioned(
            top: kToolbarHeight,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.black,
                    )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavorited =
                          !isFavorited;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorited
                        ? Color.fromARGB(255, 248, 2, 207)
                        : Colors.grey,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.20,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FittedBox(
                child: Text(
                  widget.motors.category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:Theme.of(context).brightness ==
                                            Brightness.dark?Colors.grey[100]:                    
                     Color.fromARGB(255, 95, 93, 93),
                  ),
                ),
              ),
            ),
          ),
          //imagen de moto en la page detail.
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: size.height * 0.22,
            right: sizeMotors(valueIndexSize, size),
            left: sizeMotors(valueIndexSize, size),
            child: Hero(
              tag: widget.motors.name,
              child: Image(
                image:
                    AssetImage(widget.motors.listImage[valueIndexColor].image),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.6,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.motors.category,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.motors.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ShakeTransition(
                      left: false,
                      child: Text(
                        widget.motors.price,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: widget.motors.punctuation > index
                                ? widget.motors.listImage[valueIndexColor].color
                                :Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors
                                            .white // Color del texto en tema oscuro
                                        : Colors
                                            .black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'DESCRIPTION',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              child: Text(
                                widget.motors.description,
                                softWrap:
                                    true,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.84,
            left: 16,
            right: 16,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShakeTransition(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'COLOR',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: List.generate(
                          widget.motors.listImage.length,
                          (index) => GestureDetector(
                            onTap: () {
                              valueIndexColor = index;
                              setState(() {});
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 8),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  color: widget.motors.listImage[index].color,
                                  shape: BoxShape.circle,
                                  border: index == valueIndexColor
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                ShakeTransition(
                  left: false,
                  child: CustomButton(
                    onTap: () {},
                    width: 100,
                    color: widget.motors.listImage[valueIndexColor].color,
                    child: const Text(
                      'BUY',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
