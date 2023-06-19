import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../functions/navigation_functions.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/custom_text_field.dart';

class create_account_page extends StatefulWidget {
  const create_account_page({Key? key}) : super(key: key);

  @override
  State<create_account_page> createState() => _create_account_pageState();
}

class _create_account_pageState extends State<create_account_page> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController cnfrm_pass = TextEditingController();
  bool _obscured = true;
  bool _obscured2 = true;


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
                      bottom:  MediaQuery.of(context).size.height/5.5,
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
                                    ParagraphText('Create an account 🔥', color: color.whiteColor, fontSize: 22,),
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

                      CustomTextField(
                        controller: name,
                        hintText: 'Enter Name',
                        headingText: 'Name',
                        suffix2: Icon(CupertinoIcons.person, color: color.iconsColor,),
                      ),


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
                            child:  Icon(_obscured==false? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill , color: color.iconsColor,)),
                      ),


                      CustomTextField(
                        controller: cnfrm_pass,
                        hintText: 'Confirm Password',
                        headingText: 'Confirm Password',
                        obscureText: _obscured2,
                        suffix2: InkWell(
                            onTap: (){
                              _obscured2 = !_obscured2;
                              setState(() {});
                            },
                            child:  Icon(_obscured2==false? CupertinoIcons.eye_fill : CupertinoIcons.eye_slash_fill , color: color.iconsColor,)),
                      ),

                      vSizedBox10,

                      RoundEdgedButton(
                          text: 'Create account',
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
