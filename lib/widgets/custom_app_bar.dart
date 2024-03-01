import 'package:challenge_app/settings/app_value_notifier.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: kToolbarHeight + 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.asset('assets/sport/moto.png'),
            Row(
              children: [
               
                IconButton(
                  onPressed: () {
                   
                  },
                  icon: const Icon(Icons.shopping_bag_outlined),
                ),
                 DayNightSwitcher(
                        isDarkModeEnabled: AppValueNotifier.banTheme.value,
                        onStateChanged: (isDarkModeEnabled) {
                          AppValueNotifier.banTheme.value = isDarkModeEnabled;
                        })
              ],
            )
          ]),
        ));
  }
}
