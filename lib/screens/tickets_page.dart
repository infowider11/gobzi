import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../constants/sized_box.dart';
import '../widgets/CustomTexts.dart';
import '../widgets/round_edged_button.dart';
import '../widgets/ticket_details.dart';


class tickets_page extends StatefulWidget {
  const tickets_page({Key? key}) : super(key: key);

  @override
  State<tickets_page> createState() => _tickets_pageState();
}

class _tickets_pageState extends State<tickets_page> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (tabController.indexIsChanging) {
      switch (tabController.index) {
        case 0:
          print('First tab tapped');
          break;
        case 1:
          print('Second tab tapped');
          break;

      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<MyColors> (builder: (context, color, child) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: color.whiteColor,
          appBar: AppBar(
            title: ParagraphText('Tickets', color: color.primaryTextColor, fontSize: 21,),
            backgroundColor: color.whiteColor,
            centerTitle: true,
            // leading: Padding(
            //   padding: const EdgeInsets.all(15),
            //   child: GestureDetector(
            //       behavior: HitTestBehavior.opaque,
            //       onTap: (){
            //         _openBottomSheet(context);
            //       },
            //       child: Image.asset(MyImages.filter,  height: 20,)),
            // ),
            bottom: TabBar(
              controller: tabController,
              labelColor: color.primaryTextColor,
              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/4),
              unselectedLabelColor: color.primaryTextColor,
              indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: color.primaryColor, width: 3, style: BorderStyle.solid)),
              ),
              tabs: <Widget>[
                Tab(text: "Tickets"),
                Tab(text: "RSVP"),
              ],
            ),
          ),

          body: TabBarView(
            controller: tabController,
            children: <Widget>[

              ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index){
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    push(context: context, screen: ticket_details());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Stack(
                      children: [
                        Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            child: Image.asset(MyImages.noti_banner, fit: BoxFit.cover,)),
                        Positioned(
                          left: -35,
                          top: 35,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: color.whiteColor,
                              borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                        ),
                        Positioned(
                          right: -35,
                          top: 35,
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: color.whiteColor,
                              borderRadius: BorderRadius.circular(100)
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 0,
                            child:  Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      color.blackColor.withOpacity(0.0),
                                      color.blackColor,
                                    ],
                                  )
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  hSizedBox10,
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.asset(MyImages.event_logo, height: 45,)),

                                  hSizedBox10,

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      ParagraphText('Event Organizer', fontSize: 12, color: color.whiteColor,),
                                      ParagraphText('Scotiabank Arena', fontSize: 13, color: color.whiteColor,),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                        )
                      ],
                    )
                  ),
                );
              }),

              ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    children: [
                      vSizedBox10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ParagraphText('Sam Smith: GLORIA The Tour', color: color.primaryColor, ),
                              ParagraphText('April 30 - June 25, 2023', color: color.blackColor, fontSize: 13, ),
                              ParagraphText('OPEN 4:00 PM - 10:00 PM EST', color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                              ParagraphText('1,243 going - Scotiabank Arena ', color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                            ],
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(MyImages.event1, height: 80, width: 130, fit: BoxFit.cover,)),
                        ],
                      ),
                      vSizedBox10,
                      Divider(),

                    ],
                  ),
                );
              }),

            ],

          ),
        ),
      );
    });
  }

  bool isEvent = true;
  bool isPromo = false;
  bool isFood = false;
  bool isOnlineEvents = false;
  RangeValues _currentRangeValues = const RangeValues(20, 60);

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter bottomSheetSetState)
            {
              return Consumer<MyColors>(builder: (context, color, child) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Container(
                          height: 4, width: 100, color: color.buttonTabColor,)),
                        vSizedBox20,
                        ParagraphText('Categories', color: color.primaryTextColor, fontSize: 17,),
                        vSizedBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundEdgedButton(text: 'Events', width: 75, height: 40,
                              textColor: isEvent == true ? color.whiteColor : color.primaryTextColor,
                              color: isEvent == true ? color.primaryColor : color.whiteColor,
                              border_color: isEvent == true ? color.primaryColor : color.buttonTabColor,
                              onTap: () {
                                isEvent = true;
                                isPromo = false;
                                isFood = false;
                                isOnlineEvents = false;
                                bottomSheetSetState(() {});
                              },),
                            RoundEdgedButton(text: 'Promotions', width: 95, height: 40,
                              textColor: isPromo == true ? color.whiteColor : color.primaryTextColor,
                              color: isPromo == true ? color.primaryColor : color.whiteColor,
                              border_color: isPromo == true ? color.primaryColor : color.buttonTabColor,
                              onTap: () {
                                isEvent = false;
                                isPromo = true;
                                isFood = false;
                                isOnlineEvents = false;
                                bottomSheetSetState(() {});
                              },),
                            RoundEdgedButton(text: 'Food', width: 50, height: 40,
                              textColor: isFood == true ? color.whiteColor : color.primaryTextColor,
                              color: isFood == true ? color.primaryColor : color.whiteColor,
                              border_color: isFood == true ? color.primaryColor : color.buttonTabColor,
                              onTap: () {
                                isEvent = false;
                                isPromo = false;
                                isFood = true;
                                isOnlineEvents = false;
                                bottomSheetSetState(() {});
                              },),
                            RoundEdgedButton(text: 'Online Events',
                              width: 115,
                              height: 40,
                              textColor: isOnlineEvents == true ? color.whiteColor : color.primaryTextColor,
                              color: isOnlineEvents == true ? color.primaryColor : color.whiteColor,
                              border_color: isOnlineEvents == true ? color.primaryColor : color.buttonTabColor,
                              onTap: () {
                                isEvent = false;
                                isPromo = false;
                                isFood = false;
                                isOnlineEvents = true;
                                bottomSheetSetState(() {});
                              },),
                          ],
                        ),
                        vSizedBox20,
                        ParagraphText('Price Range', color: color.primaryTextColor, fontSize: 17,),
                        vSizedBox10,
                        RangeSlider(
                          values: _currentRangeValues,
                          max: 200,
                          divisions: 10,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),

                        vSizedBox20,
                        ParagraphText('Location', color: color.primaryTextColor, fontSize: 17,),
                        vSizedBox10,
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: color.textfieldColor,
                                border: Border.all(color: color.buttonTabColor),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: ParagraphText('  London Ontario, Canada')),
                        vSizedBox20,
                        ParagraphText('Location Range (km)', color: color.primaryTextColor, fontSize: 17,),
                        vSizedBox10,

                        RangeSlider(
                          values: _currentRangeValues,
                          max: 200,
                          divisions: 10,
                          labels: RangeLabels(
                            _currentRangeValues.start.round().toString(),
                            _currentRangeValues.end.round().toString(),
                          ),
                          onChanged: (RangeValues values) {
                            setState(() {
                              _currentRangeValues = values;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              });
            });
      },
    );
  }
}
