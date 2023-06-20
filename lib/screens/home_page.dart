import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/functions/navigation_functions.dart';
import 'package:gobzi/screens/profile_page.dart';
import 'package:gobzi/screens/swiping_event_screen.dart';
import 'package:gobzi/screens/swiping_food_screen.dart';
import 'package:gobzi/screens/swiping_promo_screen.dart';
import 'package:gobzi/widgets/CustomTexts.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../constants/colorsmodal.dart';
import '../constants/sized_box.dart';
import '../functions/responsive.dart';




class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> with SingleTickerProviderStateMixin{

  bool isEvent = true;
  bool isDeal = false;
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  List swipeDeals = [
    {'image':MyImages.food2, 'name': "Scotiabank Arena", 'location': '5.2 kilometres away', },
    {'image':MyImages.food7,  'name': "Marble Slab", 'location': '4.2 kilometres away', },
    {'image':MyImages.food8,  'name': "Marble Slab", 'location': '3.2 kilometres away', },
    {'image':MyImages.food4,  'name': "Marble Slab", 'location': '7.2 kilometres away', },
    {'image':MyImages.food5,  'name': "Marble Slab", 'location': '8.2 kilometres away', },
    {'image':MyImages.food6,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
  ];
  late TabController tabController;
  MatchEngine? _matchEngine;


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    tabController.addListener(_handleTabChange);

    for (int i = 0; i < swipeDeals.length; i++)
    _swipeItems.add(SwipeItem(content: swipeDeals[i]));

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
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
        case 2:
          print('Third tab tapped');
          break;
      }
    }
  }



  @override
  Widget build(BuildContext context) {
print('device_height=${MediaQuery.of(context).size.height.toString()}');
print('device_width=${MediaQuery.of(context).size.width.toString()}');
final double width = MediaQuery.of(context).size.width;

    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
          backgroundColor: color.whiteColor,
          appBar: AppBar(
            toolbarHeight: 80,
            leadingWidth: MediaQuery.of(context).size.width/1.6,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(20,8,8,8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      push(context: context, screen: profile_page());
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(MyImages.profile_pic, height: 50,),
                    ),
                  ),
                  Image.asset(MyImages.logo, color: color.primaryColor, height: 40,),
                ],
              ),
            ),
            actions: [
            Padding(
              padding: const EdgeInsets.only(right: 22, top: 20, bottom: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      isEvent = true;
                      isDeal = false;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5),),
                        color: isEvent == true ? color.primaryColor : color.inActiveToggleColor,
                        border: Border.all(color: color.inActiveToggleIconColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(MyImages.celeb, height: 25,
                        color: isEvent == true ? color.whiteColor : color.inActiveToggleIconColor,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      isEvent = false;
                      isDeal = true;
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5), bottomRight: Radius.circular(5),),
                          color: isDeal == true ? color.primaryColor : color.inActiveToggleColor,
                          border: Border.all(color: color.inActiveToggleIconColor)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(MyImages.deal, height: 25,
                            color: isDeal == true ? color.whiteColor : color.inActiveToggleIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Column(
            children: [

              isEvent == true ?
              DefaultTabController(
                length: 3,
                child: Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.07,
                        child: TabBar(
                          controller: tabController,
                          indicatorColor: color.whiteColor,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelPadding: EdgeInsets.symmetric(horizontal: 6),
                          onTap: (index){
                           index = tabController.index;
                           print("tab===${tabController.index}");
                           setState(() {});
                          },
                          tabs: [
                            Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: tabController.index==0 ? color.primaryColor : color.whiteColor,
                                    border: Border.all(color: color.boxBorderColor),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: ParagraphText("Food", color: tabController.index==0 ? color.whiteColor : color.primaryTextColor,)),

                            Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: tabController.index==1 ? color.primaryColor : color.whiteColor,
                                    border: Border.all(color: color.boxBorderColor),
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child: ParagraphText("Events", color: tabController.index==1 ? color.whiteColor : color.primaryTextColor,)),

                            Container(
                                height: 45,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: tabController.index==2 ? color.primaryColor : color.whiteColor,
                                    border: Border.all(color: color.boxBorderColor),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: ParagraphText("Promos", color: tabController.index==2 ? color.whiteColor : color.primaryTextColor,)),
                          ],
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height* 0.01,),

                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          physics:  NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            SingleChildScrollView(child: swiping_food_screen()),
                            SingleChildScrollView(child: swiping_event_screen()),
                            SingleChildScrollView(child: swiping_promo_screen()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ):
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if(swipeDeals.length != 0)
                    ParagraphText('Today’s Exclusive Deals 🔥', fontSize: 19, fontWeight: FontWeight.w600, color: color.primaryTextColor,),
                    if(swipeDeals.length != 0)
                      vSizedBox10,

                    Container(
                      height: MediaQuery.of(context).size.height/1.45,
                      child: SwipeCards(
                        matchEngine: _matchEngine!,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child:Stack(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height/1.45,
                                    width: MediaQuery.of(context).size.width/1.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(swipeDeals[index]['image'], fit: BoxFit.cover,)),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      height: 70,
                                      width: MediaQuery.of(context).size.width/1.1,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                                          color: color.whiteColor.withOpacity(0.9)
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 10,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Image.asset(MyImages.pizza_logo, height: 55,)),

                                        hSizedBox10,

                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ParagraphText(swipeDeals[index]['name'], fontSize: 16, fontWeight: FontWeight.w600, color: color.primaryColor,),
                                            ParagraphText(swipeDeals[index]['location'], fontSize: 13, fontWeight: FontWeight.w400, color: color.greyTextColor,),
                                          ],
                                        ),

                                        hSizedBox60,

                                        Icon(CupertinoIcons.heart_fill, color: color.greyColor,),
                                        hSizedBox10,
                                        Icon(Icons.info_outline, color: color.greyColor,)
                                      ],
                                    ),
                                  )
                                ],
                              )
                          );
                        },
                        leftSwipeAllowed: true,
                        rightSwipeAllowed: true,
                        upSwipeAllowed: true,
                        fillSpace: true,
                        onStackFinished: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("No Deals Present"),
                            duration: Duration(milliseconds: 500),
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
      );
    });
  }
}
