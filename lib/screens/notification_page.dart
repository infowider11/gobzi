import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../widgets/CustomTexts.dart';


class notification_page extends StatefulWidget {
  const notification_page({Key? key}) : super(key: key);

  @override
  State<notification_page> createState() => _notification_pageState();
}

class _notification_pageState extends State<notification_page> with SingleTickerProviderStateMixin{
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
          appBar: AppBar(
            title: ParagraphText('Notifications', color: color.primaryTextColor, fontSize: 21,),
            backgroundColor: color.whiteColor,
            centerTitle: true,
            bottom: TabBar(
              controller: tabController,
              labelColor: color.primaryTextColor,
              unselectedLabelColor: color.primaryTextColor,
              labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
              indicatorPadding:  EdgeInsets.only(left: 20, right: 20),
              indicator: ShapeDecoration(
                shape: UnderlineInputBorder(
                    borderSide: BorderSide(color: color.primaryColor, width: 3, style: BorderStyle.solid)),
              ),
              tabs: <Widget>[
                Tab(text: "Announcements"),
                Tab(text: "Your updates"),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index){
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),

                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: color.box1)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(MyImages.event_logo, height: 55,)),

                              hSizedBox10,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ParagraphText('Scotiabank Arena', fontSize: 16, fontWeight: FontWeight.w600, color: color.primaryColor,),
                                  ParagraphText('3 minutes ago', fontSize: 11, fontWeight: FontWeight.w400, color: color.box2,),
                                ],
                              ),

                              hSizedBox80,

                              ParagraphText('35+', fontSize: 10,  color: color.buttonTabColor,),
                              hSizedBox10,
                              Image.asset(MyImages.heart, height: 25,),
                            ],
                          ),
                          
                          ParagraphText('Sam Smith: GLORIA The Tour', fontSize: 27, fontWeight: FontWeight.w700, color: color.blackColor,),

                          vSizedBox05,

                          Image.asset(MyImages.noti_banner),
                          vSizedBox10,
                          ParagraphText('Sam Smith, whose fourth studio album is out on Jan. 27, has announced dates for “Gloria the Tour,” '
                              'their North American tour in support of the album. ',
                            fontSize: 12, fontWeight: FontWeight.w400, color: color.greyTextColor3,),


                        ],
                      ),
                    ),
                  ),
                );
              }),

              ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index){
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(MyImages.event_logo, height: 55,)),

                      hSizedBox10,

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ParagraphText('Scotiabank Arena', fontSize: 16, fontWeight: FontWeight.w600, color: color.primaryColor,),
                          ParagraphText('Last update - 3 days ago', fontSize: 11, fontWeight: FontWeight.w400, color: color.box2,),
                        ],
                      ),

                      hSizedBox60,

                      ParagraphText('Updates On', fontSize: 13,  color: color.primaryColor,),

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
}
