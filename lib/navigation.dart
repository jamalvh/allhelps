import 'package:flutter/material.dart';

class MyNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final ValueChanged<int> onItemTapped;

  const MyNavigationBar({
    super.key,
    required this.currentPageIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(14.0), // Uniform radius
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14), topRight: Radius.circular(14)),
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: currentPageIndex != 0
                      ? Image.asset('assets/images/Home.png', height: 40)
                      : Image.asset('assets/images/Home_selected.png',
                          height: 40),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: currentPageIndex != 1
                      ? Image.asset('assets/images/Helps.png', height: 40)
                      : Image.asset('assets/images/Helps_selected.png',
                          height: 40),
                  label: 'Helps'),
              BottomNavigationBarItem(
                  icon: currentPageIndex != 2
                      ? Image.asset('assets/images/Alert.png', height: 40)
                      : Image.asset('assets/images/Alert_selected.png',
                          height: 40),
                  label: 'Alert'),
              BottomNavigationBarItem(
                  icon: currentPageIndex != 3
                      ? Image.asset('assets/images/My.png', height: 40)
                      : Image.asset('assets/images/My_selected.png',
                          height: 40),
                  label: 'My'),
            ],
            currentIndex: currentPageIndex,
            selectedItemColor: const Color(0xFF6359CA),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/helps');
                  break;
                case 2:
                  Navigator.pushNamed(context, '/alert');
                  break;
                case 3:
                  Navigator.pushNamed(context, '/my');
                  break;
              }
            }),
      ),
    );
  }
}