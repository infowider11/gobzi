import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/screens/sign_up_options.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {

  go_to_sign_up_page() {
    Future.delayed(Duration(seconds: 3),(){
      push(context: context, screen: sign_up_options());
    });
  }

  @override
  void initState() {
    go_to_sign_up_page();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
        backgroundColor: color.primaryColor,
       body:Center(
         child: Image.asset(MyImages.logo, width: 150,)
       )
      );
  });
  }

}
