import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colorsmodal.dart';
import '../constants/sized_box.dart';



class RoundEdgedButton extends StatelessWidget {
  final double? height;
  final Color? color;
  final Color? border_color;
  final Color? loaderColor;
  final String text;
  final bool load;
  final String fontfamily;
  final Function()? onTap;
  final double horizontalMargin;
  final double verticalPadding;
  final double verticalMargin;
  final double? letterSpacing;
  final bool isSolid;
  final Color? textColor;
  final double? borderRadius;
  final bool isBold;
  final double? fontSize;
  final double? width;
  final String? icon;
  final bool showGradient;
  final bool isLoad;
  final  FontWeight?  fontWeight;

  const RoundEdgedButton(
      {Key? key,
        this.color ,
        this.border_color ,
        this.loaderColor ,
      required this.text,
        this.fontfamily = 'poppins',
      this.onTap,
      this.letterSpacing,
      this.load=false,
        this.horizontalMargin=0,
        this.textColor,
        this.borderRadius,
        this.isBold = false,
        this.verticalMargin = 12,
        this.verticalPadding = 0,
        this.width,
        this.isLoad=false,
        this.fontSize=13,
        this.icon,
        this.showGradient = false,
        this.height=50,
        this.fontWeight= FontWeight.w600,
      this.isSolid=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, colorProvider, child)
    {
      return GestureDetector(
        onTap: (isLoad == true) ? null : onTap,
        child: Stack(
          children: [
            Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: horizontalMargin, vertical: verticalMargin),
                width: width ?? (MediaQuery
                    .of(context)
                    .size
                    .width),
                padding: EdgeInsets.symmetric(
                    horizontal: 8, vertical: verticalPadding),
                decoration: BoxDecoration(
                  color: color ??  colorProvider.primaryColor,
                  gradient: showGradient ? LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xfff02321),
                      Color(0xff781211),
                    ],
                  ) : null,
                  borderRadius: BorderRadius.circular(borderRadius ?? 5),
                  border:  Border.all(color: border_color ?? Colors.transparent),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // if(icon != null)
                    //   Image.asset(icon!, height: 12,),
                    // if(icon != null)
                    //   hSizedBox10,
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textColor ?? colorProvider.whiteColor,
                        fontSize: fontSize ?? 13,
                        fontWeight: fontWeight,
                        fontFamily: fontfamily,
                        letterSpacing: letterSpacing
                      ),
                    ),

                    if(icon != null)
                      hSizedBox10,
                    if(icon != null)
                      Image.asset(icon!, height: 20,),


                    if(isLoad == true)
                      Row(
                        children: [
                          SizedBox(width: MediaQuery
                              .of(context)
                              .size
                              .width * 0.03),
                          CupertinoActivityIndicator(
                            radius: 15, color: loaderColor,)
                        ],
                      )


                  ],
                )
            ),
          ],
        ),
      );
    });
  }
}
