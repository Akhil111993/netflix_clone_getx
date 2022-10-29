import 'package:flutter/material.dart';

ValueNotifier<int> valueNotifier = ValueNotifier(0);
const bottomNavItems = [
  'Home',
  'New & Hot',
  'Fast Laughs',
  'Search',
  'Downloads'
];

const bottomNavIcons = [
  Icons.home,
  Icons.collections,
  Icons.emoji_emotions,
  Icons.search,
  Icons.arrow_downward_outlined,
];

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: ((context, int value, child) => BottomNavigationBar(
            currentIndex: valueNotifier.value,
            onTap: (value) => valueNotifier.value = value,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 10,
            backgroundColor: Colors.black,
            items: List.generate(
              5,
              (index) => BottomNavigationBarItem(
                  icon: Icon(bottomNavIcons[index]),
                  label: bottomNavItems[index]),
            ),
          )),
    );
  }
}
