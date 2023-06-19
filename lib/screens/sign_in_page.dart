import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../functions/responsive.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/custom_text_field.dart';
import 'forget_password.dart';

class sign_in_page extends StatefulWidget {
  const sign_in_page({Key? key}) : super(key: key);

  @override
  State<sign_in_page> createState() => _sign_in_pageState();
}

class _sign_in_pageState extends State<sign_in_page> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _obscured = true;


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
                      bottom:  MediaQuery.of(context).size.height/5,
                      left: 15,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back, color: color.whiteColor, size: 35,)),
                            vSizedBox60,
                            ParagraphText('Sign In 🌟', color: color.whiteColor, fontSize: 24,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                              child: ParagraphText('Welcome back to Gobzi.',
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


                      CustomTextField(
                        controller: email,
                        hintText: 'Enter Email',
                        headingText: 'Email',
                        suffix2: Icon(CupertinoIcons.mail, color: color.iconsColor,),
                      ),


                      CustomTextField(
                        controller: pass,
                        hintText: 'Enter Password',
                        headingText: 'Password',
                        obscureText: _obscured,
                        suffix2: InkWell(
                            onTap: (){
                              _obscured = !_obscured;
                              setState(() {});
                            },
                            child: Icon(_obscured==false? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill , color: color.iconsColor,)),
                      ),


                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.01 : MediaQuery.of(context).size.height*0.02,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(color: color.boxBorderColor, height: 1, width: MediaQuery.of(context).size.width/3),

                          ParagraphText('Or With'),

                          Container(color: color.boxBorderColor, height: 1, width: MediaQuery.of(context).size.width/3),
                        ],
                      ),

                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.015 :  MediaQuery.of(context).size.height*0.03,),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width/2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: color.boxBorderColor)
                              ),
                              child: Row(
                                children: [
                                  hSizedBox20,
                                  Image.asset(MyImages.facebook, height: 25,),
                                  hSizedBox20,
                                  ParagraphText('Facebook', color: color.primaryTextColor, fontSize: 13,),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){

                            },
                            child: Container(
                              height: 45,
                              width: MediaQuery.of(context).size.width/2.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: color.boxBorderColor)
                              ),
                              child: Row(
                                children: [
                                  hSizedBox20,
                                  Image.asset(MyImages.google, height: 25,),
                                  hSizedBox20,
                                  ParagraphText('Google', color: color.primaryTextColor, fontSize: 13,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height:  isSmallDevice(context) ? MediaQuery.of(context).size.height*0.015 :  MediaQuery.of(context).size.height*0.03,),

                      
                      InkWell(
                          onTap: (){
                            push(context: context, screen: forget_password());
                          },
                          child: ParagraphText('Forgot Password?')),

                     SizedBox(height:  isSmallDevice(context) ? 0 : MediaQuery.of(context).size.height*0.03,),


                      RoundEdgedButton(
                        text: 'Log In',
                        onTap: (){
                          push(context: context, screen: bottom_bar());
                        },
                      )

                    ],
                  ),
                )
              ],
            ),
          )
      );
    });
  }
}
