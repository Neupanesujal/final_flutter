import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:y/home_page.dart';
import 'package:flutter/material.dart';
//import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class NavigationPage extends StatefulWidget {

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  // get currentIndex => null;
  void onTap(int index){
    setState(() {
 selectedIndex = index;
      
    });
 print(selectedIndex);
  }

  int selectedIndex = 0;

List pages = [homePage(), homePage(), homePage(), homePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        // currentIndex: currentIndex,
        index: selectedIndex,
         onTap: onTap,
         height: 60,
         backgroundColor: Colors.transparent,
        // onTap: onTap,
        items: [
             Icon(Icons.home),
             Icon(Icons.card_travel),
             Icon(Icons.money_off_csred_sharp),
             Icon(Icons.man),

       
        ],
      ),
    );
  }
}