import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/custom_text_field.dart';

class forget_password extends StatefulWidget {
  const forget_password({Key? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  TextEditingController email = TextEditingController();


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
                            vSizedBox40,
                            vSizedBox10,

                            ParagraphText('Forgot Password 🔐', color: color.whiteColor, fontSize: 24,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
                              child: ParagraphText('Enter your email and we will send you a link to reset your password.',
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      CustomTextField(
                        controller: email,
                        hintText: 'Enter Email',
                        headingText: 'Email',
                        suffix2: Icon(CupertinoIcons.mail, color: color.iconsColor,),
                      ),


                      RoundEdgedButton(
                        text: 'Reset Password',
                        onTap: (){

                        },
                      ),
                      
                      ParagraphText('Resend email')

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
