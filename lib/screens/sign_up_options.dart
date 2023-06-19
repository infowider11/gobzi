import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/screens/create_account_page.dart';
import 'package:gobzi/screens/sign_in_page.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../functions/responsive.dart';
import '../widgets/CustomTexts.dart';

class sign_up_options extends StatefulWidget {
  const sign_up_options({Key? key}) : super(key: key);

  @override
  State<sign_up_options> createState() => _sign_up_optionsState();
}

class _sign_up_optionsState extends State<sign_up_options> {


  @override
  Widget build(BuildContext context) {

    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
          backgroundColor: color.whiteColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(MyImages.blue_circle,   height: MediaQuery.of(context).size.height/2.4, fit: BoxFit.cover,),
                    Positioned(
                      bottom:  MediaQuery.of(context).size.height/6,
                      left: 15,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphText('Let’s Get Started 🎉', color: color.whiteColor, fontSize: 24,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                              child: ParagraphText('Sign up today and re-discover what your city has to offer.',
                                color: color.whiteColor, fontSize: 12, fontWeight: FontWeight.w400,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.02 : MediaQuery.of(context).size.height*0.03,),

                      GestureDetector(
                        onTap: (){
                          push(context: context, screen: create_account_page());
                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: color.boxBorderColor)
                          ),
                          child: ParagraphText('Continue with email address', color: color.primaryTextColor, fontSize: 13,),
                        ),
                      ),

                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.02 : MediaQuery.of(context).size.height*0.03,),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: color.boxBorderColor)
                          ),
                          child: Row(
                            children: [
                              hSizedBox20,
                              Image.asset(MyImages.facebook, height: 25,),
                              hSizedBox50,
                              ParagraphText('Continue with Facebook', color: color.primaryTextColor, fontSize: 13,),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.02 : MediaQuery.of(context).size.height*0.03,),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: color.boxBorderColor)
                          ),
                          child: Row(
                            children: [
                              hSizedBox60,
                              Image.asset(MyImages.apple, height: 25,),
                              hSizedBox20,
                              ParagraphText('Continue with Apple', color: color.primaryTextColor, fontSize: 13,),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.02 : MediaQuery.of(context).size.height*0.03,),

                      GestureDetector(
                        onTap: (){

                        },
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: color.boxBorderColor)
                          ),
                          child: Row(
                            children: [
                              hSizedBox20,
                              Image.asset(MyImages.google, height: 25,),
                              hSizedBox50,
                              ParagraphText('Continue with Google', color: color.primaryTextColor, fontSize: 13,),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.02 : MediaQuery.of(context).size.height*0.03,),

                      InkWell(
                        onTap: (){
                          push(context: context, screen: sign_in_page());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(color: color.boxBorderColor, height: 1, width: 120,),
                            hSizedBox05,
                            ParagraphText('Sign In', color: color.primaryColor,),
                            hSizedBox05,
                            Container(color: color.boxBorderColor, height: 1, width: 120,),
                          ],
                        ),
                      ),




                    ],
                  ),
                )
              ],
            ),
          ),

        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.fromLTRB(30,10,30,20),
          child: RichText(
            textAlign: TextAlign.center,
              text: TextSpan(
              children: [
                TextSpan(text: 'By signing up, you agree to our', style: TextStyle(color: color.secondaryTextColor, fontFamily: 'poppins')),
                TextSpan(text: ' Terms of Use ', style: TextStyle(color: color.blackColor, fontFamily: 'poppins')),
                TextSpan(text: ' and confirm that you have read our ', style: TextStyle(color: color.secondaryTextColor, fontFamily: 'poppins')),
                TextSpan(text: 'Privacy Policy. ', style: TextStyle(color: color.blackColor, fontFamily: 'poppins')),
                TextSpan(text: ' To learn how we collect, use and share your data.', style: TextStyle(color: color.secondaryTextColor, fontFamily: 'poppins')),
              ]
          )),
        ),
      );
    });
  }
}
