import 'package:flutter/material.dart';
import 'package:gobzi/screens/home_page.dart';
import 'package:gobzi/screens/notification_page.dart';
import 'package:gobzi/screens/search_page.dart';
import 'package:gobzi/screens/tickets_page.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../screens/favorite_page.dart';

class bottom_bar extends StatefulWidget {

  bottom_bar({Key? key}) : super(key: key);

  @override
  State<bottom_bar> createState() => _bottom_barState();
}

class _bottom_barState extends State<bottom_bar> {
  int _selectedIndex = 2;


  void _onItemTapped(int index) {
    setState(() {
      print('pressed $_selectedIndex index');
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child)
    {
      return Scaffold(
        body: Center(
          child: [
            favorite_page(),
            notification_page(),
            home_page(),
            search_page(),
            tickets_page(),
          ].elementAt(_selectedIndex),
        ),

        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ]
          ),

          child: BottomNavigationBar(
            backgroundColor: color.whiteColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 10,
            elevation: 0,
            unselectedFontSize: 10,
            unselectedItemColor: color.tabsIconColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: '',
                icon: ImageIcon(
                  AssetImage(MyImages.favorite),
                  color: color.tabsIconColor,
                  size: 25,
                ),
                // icon: Icon(Icons.),
                activeIcon: ImageIcon(
                  AssetImage(MyImages.favorite),
                  color: color.primaryColor,
                  size: 25,
                ),
                backgroundColor: color.whiteColor,
              ),
              BottomNavigationBarItem(
                label: '',
                icon: ImageIcon(
                  AssetImage(MyImages.notification),
                  color: color.tabsIconColor,
                  size: 25,
                ),
                // icon: Icon(Icons.),
                activeIcon: ImageIcon(
                  AssetImage(MyImages.notification),
                  color: color.primaryColor,
                  size: 25,
                ),
                backgroundColor: color.whiteColor,
              ),
              BottomNavigationBarItem(
                  label: '',

                  icon: ImageIcon(
                    AssetImage(MyImages.gobzi),
                    color: color.tabsIconColor,
                    size: 25,
                  ),
                  activeIcon: ImageIcon(
                    AssetImage(MyImages.gobzi),
                    color: color.primaryColor,
                    size: 25,
                  ),
                  backgroundColor: color.whiteColor
              ),
              BottomNavigationBarItem(

                icon: ImageIcon(
                  AssetImage(MyImages.search),
                  color:  color.tabsIconColor,
                  size: 25,
                ),
                activeIcon: ImageIcon(
                  AssetImage(MyImages.search),
                  color: color.primaryColor,
                  size: 25,
                ),
                label: '',
                backgroundColor:  color.whiteColor,
              ),
              BottomNavigationBarItem(

                icon: ImageIcon(
                  AssetImage(MyImages.ticket),
                  color:  color.tabsIconColor,
                  size: 25,
                ),
                activeIcon: ImageIcon(
                  AssetImage(MyImages.ticket),
                  color: color.primaryColor,
                  size: 25,
                ),
                label: '',
                backgroundColor:  color.whiteColor,
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor:  color.primaryColor,
            onTap: _onItemTapped,
          ),
        ),
      );
    });
  }
}