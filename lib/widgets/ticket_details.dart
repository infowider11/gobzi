import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../screens/buy_tickets.dart';
import 'CustomTexts.dart';
import 'bottom_bar.dart';

class ticket_details extends StatelessWidget {
  const ticket_details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child)
    {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: color.primaryColor,)),
          centerTitle: true,
          title: ParagraphText('Tickets', fontSize: 20, color: color.primaryTextColor,),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.2,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(MyImages.ticket_background, )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height*0.11,),

                      GestureDetector(
                          onTap: (){
                            pushReplacement(context: context, screen: bottom_bar());
                          },
                          child: Image.asset(MyImages.noti_banner, height: 160, width: MediaQuery.of(context).size.width,)),

                      ParagraphText('Sam Smith: GLORIA The Tour', fontSize: 25, fontWeight: FontWeight.w700, color: color.blackColor,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParagraphText('Event Organizer', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                              ParagraphText('Scotiabank Arena', fontSize: 11, fontWeight: FontWeight.w700, color: color.blackColor,),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ParagraphText('Gate', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                              ParagraphText('A21', fontSize: 11, fontWeight: FontWeight.w700, color: color.blackColor,),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ParagraphText('Time', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                              ParagraphText('9pm - 12pm', fontSize: 11, fontWeight: FontWeight.w700, color: color.blackColor,),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ParagraphText('Date', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                              ParagraphText('Fri, April 30 - June 25, 2023', fontSize: 11, fontWeight: FontWeight.w700, color: color.blackColor,),
                            ],
                          ),

                        ],
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),


                      ParagraphText('Address', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                      ParagraphText('40 Bay St, Toronto', fontSize: 11, fontWeight: FontWeight.w700, color: color.blackColor,),

                      SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                      DottedLine(dashLength: 10, dashColor: color.buttonTabColor,),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                      RoundEdgedButton(text: 'Download Ticket', onTap: (){
                        push(context: context, screen: buy_tickets());
                      },)
                    ],
                  ),
                ),
              ),
              ///
              // Positioned(
              //   left: -15,
              //   bottom: 95,
              //   child: Container(
              //   height: 60,
              //   width: 60,
              //   decoration: BoxDecoration(
              //       color: color.whiteColor,
              //       borderRadius: BorderRadius.circular(100),
              //
              //   ),
              //     ),
              // ),
              // Positioned(
              //   right: -15,
              //   bottom: 95,
              //   child: Container(
              //   height: 60,
              //   width: 60,
              //   decoration: BoxDecoration(
              //       color: color.whiteColor,
              //       borderRadius: BorderRadius.circular(100)
              //   ),
              //     ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
