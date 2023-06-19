import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/screens/buy_tickets.dart';
import 'package:gobzi/widgets/CustomTexts.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';

class event_details extends StatefulWidget {
  const event_details({Key? key}) : super(key: key);

  @override
  State<event_details> createState() => _event_detailsState();
}

class _event_detailsState extends State<event_details> {
  int currentIndex = 0;
  List eventLists = [
    MyImages.event1,
    MyImages.event2,
    MyImages.event3,
  ];
  List proPicList = [
    MyImages.profile_pic,
    MyImages.profile_pic,
    MyImages.profile_pic,
    MyImages.profile_pic,
    MyImages.profile_pic,

  ];


  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child)
    {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height:  350,
                      viewportFraction:  1.0,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      disableCenter: false,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                    ),
                    items: eventLists.map((plan) {
                      return Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          child: Image.asset(
                            plan,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 30,
                    left: MediaQuery.of(context).size.width/2.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: eventLists.map((item) {
                        int index = eventLists.indexOf(item);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index ? color.whiteColor : color.greyColor,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: color.whiteColor.withOpacity(0.8)
                      ),
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_new, size: 20, color: color.arrowGrey,)),
                    )
                  ),
                ],
              ),

              vSizedBox40,
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphText('Event Details', color: color.blackColor, fontSize: 12, fontWeight: FontWeight.w400,),
                            ParagraphText('Scotiabank Arena', color: color.primaryColor, ),
                          ],
                        ),

                        Row(
                          children: [
                            Image.asset(MyImages.heart, height: 30,),
                            hSizedBox10,

                            RoundEdgedButton(
                              text: 'RSVP',
                              width: 80,
                              height: 40,
                              fontSize: 15,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.w700,
                              color: color.buttonTabColor,
                              border_color: color.borderColor,
                            ),
                          ],
                        )
                      ],
                    ),
                    vSizedBox20,

                    ParagraphText('Sam Smith: GLORIA The Tour', color: color.primaryTextColor, fontSize: 19,),
                    vSizedBox20,

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color.textfieldColor,
                        border: Border.all(color: color.buttonTabColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            vSizedBox05,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.calendar_today, color: color.primaryColor,),

                                hSizedBox10,

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ParagraphText('April 30 - June 25, 2023', fontSize: 16, color: color.blackColor,),
                                    ParagraphText('OPEN 4:00 PM - 10:00 PM EST', fontSize: 13, color: color.greyTextColor2, fontWeight: FontWeight.w400,),
                                  ],
                                )
                              ],
                            ),
                            vSizedBox20,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on, color: color.primaryColor,),

                                hSizedBox10,

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ParagraphText('Scotiabank Arena', fontSize: 16, color: color.blackColor,),
                                    ParagraphText('40 Bay St, Toronto', fontSize: 13, color: color.greyTextColor2, fontWeight: FontWeight.w400,),
                                  ],
                                )
                              ],
                            ),
                            vSizedBox05,
                          ],
                        ),
                      ),
                    ),

                    vSizedBox20,

                    ParagraphText('About', color: color.primaryTextColor, fontSize: 20, fontWeight: FontWeight.w400,),
                    vSizedBox05,
                    ParagraphText('Sam Smith, whose fourth studio album is out on Jan. 27, has announced dates for “Gloria the Tour,” their North American'
                        ' tour in support of the album. ', color: color.greyTextColor3, fontSize: 13, fontWeight: FontWeight.w400,),

                    vSizedBox10,

                    Divider(),


                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                vSizedBox20,
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(MyImages.event_logo, height: 55,)),
                                ),
                              ],
                            ),

                            Positioned(
                                top: 0,
                                left: 25,
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(100),
                                  color: color.whiteColor.withOpacity(0.8),
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: color.whiteColor.withOpacity(0.8),
                                    ),
                                    child: GestureDetector(
                                        onTap: (){
                                          Navigator.pop(context);
                                        },
                                        child: Icon(Icons.notifications, size: 20, color: color.primaryColor,)),
                                  ),
                                )
                            ),

                          ],
                        ),

                        hSizedBox10,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphText('Event Organizer', fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,),
                            ParagraphText('Scotiabank Arena', fontSize: 13,  color: color.blackColor,),
                          ],
                        ),

                        hSizedBox20,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphText('Attending', fontSize: 11, fontWeight: FontWeight.w400, color: color.blackColor,),

                            Row(
                                children: [
                                  for (int i = 0; i < proPicList.length; i++)
                                    Align(
                                    widthFactor: 0.5,
                                    child: CircleAvatar(
                                      radius: 17,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                          radius: 16,
                                          backgroundColor: Colors.white,
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(100),
                                              child:
                                              Image.asset(proPicList[i])
                                          )),
                                    ),
                                  ),

                                  hSizedBox20,
                                  ParagraphText('+1,243', fontSize: 11, fontWeight: FontWeight.w400, color: color.blackColor,),

                                ],
                              ),


                          ],
                        ),



                      ],
                    ),

                    vSizedBox10,

                    Divider(),

                    vSizedBox20,
                    
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(MyImages.map)),

                    vSizedBox20,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ParagraphText('Ticket Info', fontSize: 11, fontWeight: FontWeight.w400, color: color.blackColor,),
                            ParagraphText('\$45.00 per ticket', fontSize: 13,  color: color.primaryColor,),
                          ],
                        ),
                        RoundEdgedButton(
                          text: 'Order Tickets',
                          width: 160,
                          icon: MyImages.white_ticket,
                          onTap: (){
                            push(context: context, screen: buy_tickets());
                          },
                        )
                      ],
                    ),

                    Divider(),
                    vSizedBox10,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        hSizedBox05,
                        Image.asset(MyImages.globe, height: 30,),
                        Image.asset(MyImages.fb, height: 30,),
                        Image.asset(MyImages.insta, height: 30,),
                        Image.asset(MyImages.twitter, height: 30,),
                        hSizedBox05,
                      ],
                    ),
                    vSizedBox20,
                  ],
                ),
              ),


            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RoundEdgedButton(
                  text: 'Directions',
                width: MediaQuery.of(context).size.width/2.3,
              ),
              RoundEdgedButton(
                  text: 'Share',
                width: MediaQuery.of(context).size.width/2.3,
              ),
            ],
          ),
        ),
      );
    });
  }
}
