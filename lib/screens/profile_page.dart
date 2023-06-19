import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/custom_text_field.dart';

class profile_page extends StatefulWidget {
  const profile_page({Key? key}) : super(key: key);

  @override
  State<profile_page> createState() => _profile_pageState();
}

class _profile_pageState extends State<profile_page> {
  bool isPushNoti = false;
  bool isDarkMode = false;
  TextEditingController card_no = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvvCode = TextEditingController();
  File? imgFile;
  final imgPicker = ImagePicker();


  ///image upload code
  Future<void> _image_camera_dialog(BuildContext context) async{
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Center(child: ParagraphText('Select an Image',)),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async{
              var imgGallery = await imgPicker.pickImage(source: ImageSource.gallery);
              setState(() {
                imgFile = File(imgGallery!.path);
              });
              Navigator.pop(context);
            },
            child: ParagraphText('Select a photo from Gallery',),),
          CupertinoActionSheetAction(
            onPressed: () async{
              var imgCamera = await imgPicker.pickImage(source: ImageSource.camera);
              setState(() {
                imgFile = File(imgCamera!.path);
              });
              Navigator.pop(context);
            },
            child: ParagraphText('Take a photo with the camera',),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: ParagraphText('Cancel',),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: color.primaryColor,)),
          title: ParagraphText('Profile', fontSize: 20, color: color.primaryTextColor,),
          centerTitle: true,
          actions: [
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 18, right: 15),
                child: ParagraphText('Sign out', fontSize: 13, color: color.primaryColor,),
              ),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              vSizedBox10,

              Center(
                  child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child:
                      imgFile != null ?
                      Image.file(imgFile!, height: 150, width: 150, fit: BoxFit.cover,):
                      Image.asset(MyImages.profile_pic, height: 150, width: 150, fit: BoxFit.cover,)),

                  Positioned(
                    right: 0,
                      bottom: 0,
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: ()  {
                            _image_camera_dialog(context);
                          },
                          child: Image.asset(MyImages.edit_pic, height: 45,))),
                ],
              )),



              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParagraphText('Angela Gooding', fontSize: 25, color: color.blackColor,),
                  hSizedBox05,
                  InkWell(
                      onTap: (){

                      },
                      child: Image.asset(MyImages.edit, height: 20,))
                ],
              ),

              vSizedBox10,



              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    vSizedBox10,
                    ParagraphText('Settings', fontSize: 15, color: color.primaryColor,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText('Push Notifications', fontSize: 14, color: color.blackColor, ),
                        Switch(
                            value: isPushNoti,
                            activeColor: color.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                isPushNoti = value;
                              });
                            },)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText('Dark Mode', fontSize: 14, color: color.blackColor, ),
                        Switch(
                            value: isDarkMode,
                            activeColor: color.primaryColor,
                            onChanged: (value) {
                              setState(() {
                                isDarkMode = value;
                              });
                            },)
                      ],
                    ),
                    Divider(),
                    vSizedBox10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ParagraphText('Payment Details', fontSize: 15, color: color.primaryColor,),
                        InkWell(
                            onTap: (){

                            },
                            child: Image.asset(MyImages.edit, height: 20,))
                      ],
                    ),
                    CustomTextField(
                      controller: card_no,
                      hintText: '1234  5678  9101  1121',
                      headingText: 'Card Number',
                      keyboardType: TextInputType.number,
                      textColor: color.black2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextField(
                          controller: expiryDate,
                          hintText: 'MM/YY',
                          keyboardType: TextInputType.datetime,
                          headingText: 'Card Number',
                          width: MediaQuery.of(context).size.width/2.5,
                          textColor: color.black2,
                        ),
                        CustomTextField(
                          controller: cvvCode,
                          hintText: '123',
                          keyboardType: TextInputType.datetime,
                          headingText: 'CVV',
                          width: MediaQuery.of(context).size.width/2.5,
                          textColor: color.black2,
                        ),
                      ],
                    ),
                    ParagraphText('Remove my card', fontSize: 15, color: color.primaryColor, fontWeight: FontWeight.w400,),
                    vSizedBox10,
                    ParagraphText('Your personal data will be used to process your order, support your experience throughout this website, and for other '
                        'purposes described in our privacy policy.',
                      fontSize: 11, fontWeight: FontWeight.w400, color: color.greyTextColor.withOpacity(0.5),),
                    vSizedBox10,
                    Divider(),
                    vSizedBox20,

                    RoundEdgedButton(
                        text: 'Save Changes',
                    ),
                    vSizedBox20,

                    Center(
                      child: Column(

                        children: [
                          Image.asset(MyImages.gobzi_blue, height: 40,),
                          vSizedBox10,
                          ParagraphText('Account info', fontSize: 15, color: color.blackColor, ),
                          vSizedBox05,
                          ParagraphText('Delete my Account', fontSize: 13, color: color.primaryColor, fontWeight: FontWeight.w400, underlined: true,),
                          vSizedBox10,
                          ParagraphText('Your account will be deleted. Your name, photos, and all other account data will be removed from Gobzi.',
                            fontSize: 11, fontWeight: FontWeight.w400, color: color.greyTextColor.withOpacity(0.5),),
                          vSizedBox20,
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      );
    });
  }
}
