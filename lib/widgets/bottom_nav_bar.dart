import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;


  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: null,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xff7A6EAE),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.sell), label: "Sell"),
        BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Inbox"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
