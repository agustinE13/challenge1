import 'package:challenge_app/models/data.dart';
import 'package:challenge_app/pages/details_moto.dart';
import 'package:challenge_app/widgets/custom_app_bar.dart';
import 'package:challenge_app/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePageMotors extends StatefulWidget {
  const HomePageMotors({Key? key}) : super(key: key);

  @override
  State<HomePageMotors> createState() => _HomePageMotorsState();
}

class _HomePageMotorsState extends State<HomePageMotors> {
  final _pageController = PageController(viewportFraction: 0.75);
  double _currentPage = 0.0;
  double indexPage = 0.0;
  late ThemeData themeData = Theme.of(context);

  void _listener() {
    setState(() {
      _currentPage = _pageController.page!;
      if (_currentPage >= 0 && _currentPage < 0.7) {
        indexPage = 0;
      } else if (_currentPage > 0.7 && _currentPage < 1.7) {
        indexPage = 1;
      } else if (_currentPage > 1.7 && _currentPage < 2.7) {
        indexPage = 2;
      }
    });
  }

  Color getcolor() {
    late final Color color;
    if (_currentPage >= 0 && _currentPage < 0.7) {
      color = listMotos[0].listImage[0].color;
    } else if (_currentPage > 0.7 && _currentPage < 1.7) {
      color = listMotos[1].listImage[0].color;
    } else if (_currentPage > 1.7 && _currentPage < 2.7) {
      color = listMotos[2].listImage[0].color;
    }
    return color;
  }

  @override
  void initState() {
    _pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: List.generate(
                    listCategory.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(
                            listCategory[index],
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: index == 0
                                    ? getcolor()
                                    : Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors
                                            .white 
                                        : Colors
                                            .black 
                                ),
                          ),
                        )),
              ),
            ),
          ),
          Expanded(
              child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: listMotos.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    final motors = listMotos[index];
                    final listTitle = motors.category.split(' ');
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (context, animation, _) {
                            return DetailsMotorsPage(motors: motors);
                          },
                        ));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: index == indexPage ? 30 : 60),
                        child: Transform.translate(
                          offset: Offset(index == indexPage ? 0 : 20, 0),
                          child: LayoutBuilder(builder: (context, constraints) {
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: EdgeInsets.only(
                                  top: index == indexPage ? 30 : 50,
                                  bottom: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(36),
                                  color: Theme.of(context).brightness ==
                                            Brightness.dark
                                      ? Colors.white
                                      : Colors.black),
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 40),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          motors.category,
                                          style: TextStyle(
                                              color: Theme.of(context).brightness ==
                                            Brightness.dark
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          motors.name,
                                          style: TextStyle(
                                              fontSize: 28,
                                              color: Theme.of(context).brightness ==
                                            Brightness.dark
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          motors.price,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context).brightness ==
                                            Brightness.dark
                                                  ? Colors.black
                                                  : Colors.white),
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        FittedBox(
                                          child: Text(
                                              '${listTitle[0]} \n ${listTitle[1]}',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                      top: constraints.maxHeight * 0.2,
                                      left: constraints.maxWidth * 0.05,
                                      right: constraints.maxWidth * 0.16,
                                      bottom: constraints.maxHeight * 0.2,
                                      child: Hero(
                                        tag: motors.name,
                                        child: Image(
                                          image: AssetImage(
                                            motors.listImage[0].image,
                                          ),
                                        ),
                                      )),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Material(
                                        color: motors.listImage[0].color,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(46),
                                            topLeft: Radius.circular(46),
                                            bottomLeft: Radius.circular(46),
                                            bottomRight: Radius.circular(46)),
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        child: InkWell(
                                          onTap: () {},
                                          child: const SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Icon(
                                              Icons.add,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  })),
          Container(
            height: 120,
            padding: const EdgeInsets.all(20),
            child: CustomBottomBar(color: getcolor()),
          )
        ],
      ),
    );
  }
}
