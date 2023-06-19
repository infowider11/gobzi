import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../widgets/CustomTexts.dart';


class favorite_page extends StatefulWidget {
  const favorite_page({Key? key}) : super(key: key);

  @override
  State<favorite_page> createState() => _favorite_pageState();
}

class _favorite_pageState extends State<favorite_page> with SingleTickerProviderStateMixin{
  late TabController tabController;
  bool isLiked = false;
  List likedList = [
    {'image' : MyImages.event2, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.noti_banner, 'title' : 'Popeyes Chicken', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.event1, 'title' : 'Marble Slab', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.event3, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.noti_banner, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  ];
  List foodList = [
  {'image' : MyImages.food1, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food2, 'title' : 'Popeyes Chicken', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food3, 'title' : 'Marble Slab', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food4, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food5, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food6, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food7, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  {'image' : MyImages.food8, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  ];
  List promoList = [
    {'image' : MyImages.promo1, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.promo2, 'title' : 'Popeyes Chicken', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.promo3, 'title' : 'Marble Slab', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},

  ];
  List dealsList = [
    {'image' : MyImages.Deal1, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.Deal2, 'title' : 'Popeyes Chicken', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.Deal3, 'title' : 'Marble Slab', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.Deal4, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},

  ];
  List eventList = [
    {'image' : MyImages.event1, 'title' : 'Sam Smith: GLORIA The Tour', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.event2, 'title' : 'Popeyes Chicken', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.event3, 'title' : 'Marble Slab', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
    {'image' : MyImages.Deal4, 'title' : 'Scotiabank Arena Event', 'date' : 'April 30 - June 25, 2023', 'time':'OPEN 4:00 PM - 10:00 PM EST' , 'location':'1,243 going - Scotiabank Arena'},
  ];




  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
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
        case 2:
          print('Third tab tapped');
          break;
          case 3:
          print('Fourth tab tapped');
          break;
          case 4:
          print('Fifth tab tapped');
          break;

      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<MyColors> (builder: (context, color, child) {
      return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: ParagraphText('Your Likes', color: color.primaryTextColor, fontSize: 21,),
            backgroundColor: Colors.white,
            centerTitle: true,
            bottom: TabBar(
              controller: tabController,
              labelColor: color.primaryTextColor,
              unselectedLabelColor: color.primaryTextColor,
              labelPadding: EdgeInsets.only(left: 15, right: 15),
              isScrollable: true,
              indicator: ShapeDecoration(
                  shape: UnderlineInputBorder(
                      borderSide: BorderSide(color: color.primaryColor, width: 3, style: BorderStyle.solid)),
              ),
              tabs: <Widget>[
                Tab(text: "Likes"),
                Tab(text: "Food"),
                Tab(text: "Events"),
                Tab(text: "Promotions"),
                Tab(text: "Daily Deals"),
              ],
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              ListView.builder(
                  itemCount: likedList.length,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                  Dismissible(
                    key: Key(index.toString()),
                    direction: DismissDirection.endToStart,
                    dragStartBehavior: DragStartBehavior.down,
                    movementDuration: Duration(seconds: 30),
                    onDismissed: (direction){

                    },
                    background: Container(
                      color: Colors.red,
                      width: 60,
                      padding: const EdgeInsets.all(10),
                      alignment: AlignmentDirectional.centerStart,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    secondaryBackground: Container(
                        color: color.pinkColor,
                        width: 60,
                        padding: const EdgeInsets.all(20),
                        alignment: AlignmentDirectional.centerEnd,
                        child: ParagraphText('Remove', color: color.whiteColor,)
                    ),
                    child:    Column(
                      children: [
                        vSizedBox10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                ParagraphText(likedList[index]['title'], color: color.primaryColor, ),
                                ParagraphText(likedList[index]['date'], color: color.blackColor, fontSize: 13, ),
                                ParagraphText(likedList[index]['time'], color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                                ParagraphText(likedList[index]['location'] , color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                              ],
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(likedList[index]['image'], height: 80, width: 130, fit: BoxFit.cover,))
                          ],
                        ),
                        vSizedBox10,
                        Divider(),

                      ],
                    ),),

                );
              }),

              ListView.builder(
                  itemCount: foodList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        dragStartBehavior: DragStartBehavior.down,
                        movementDuration: Duration(seconds: 30),
                        onDismissed: (direction){

                        },
                        background: Container(
                          color: Colors.red,
                          width: 60,
                          padding: const EdgeInsets.all(10),
                          alignment: AlignmentDirectional.centerStart,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                            color: color.pinkColor,
                            width: 60,
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: ParagraphText('Remove', color: color.whiteColor,)
                        ),
                        child:    Column(
                          children: [
                            vSizedBox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    ParagraphText(foodList[index]['title'], color: color.primaryColor, ),
                                    ParagraphText(foodList[index]['date'], color: color.blackColor, fontSize: 13, ),
                                    ParagraphText(foodList[index]['time'], color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                                    ParagraphText(foodList[index]['location'] , color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                                  ],
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(foodList[index]['image'], height: 80, width: 130, fit: BoxFit.cover,))
                              ],
                            ),
                            vSizedBox10,
                            Divider(),

                          ],
                        ),),

                    );
                  }),

              ListView.builder(
                  itemCount: eventList.length,
                  itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                  Dismissible(
                      key: Key(index.toString()),
                      direction: DismissDirection.endToStart,
                      dragStartBehavior: DragStartBehavior.down,
                      movementDuration: Duration(seconds: 30),
                      onDismissed: (direction){

                      },
                      background: Container(
                        color: Colors.red,
                        width: 60,
                        padding: const EdgeInsets.all(10),
                        alignment: AlignmentDirectional.centerStart,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      secondaryBackground: Container(
                        color: color.pinkColor,
                        width: 60,
                        padding: const EdgeInsets.all(20),
                        alignment: AlignmentDirectional.centerEnd,
                        child: ParagraphText('Remove', color: color.whiteColor,)
                      ),
                      child:   Column(
                        children: [
                          vSizedBox10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  ParagraphText(eventList[index]['title'], color: color.primaryColor, ),
                                  ParagraphText(eventList[index]['date'], color: color.blackColor, fontSize: 13, ),
                                  ParagraphText(eventList[index]['time'], color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                                  ParagraphText(eventList[index]['location'] , color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                                ],
                              ),
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(eventList[index]['image'], height: 80, width: 130, fit: BoxFit.cover,))
                            ],
                          ),
                          vSizedBox10,
                          Divider(),

                        ],
                      ),),

                );
              }),

              ListView.builder(
                  itemCount: promoList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        dragStartBehavior: DragStartBehavior.down,
                        movementDuration: Duration(seconds: 30),
                        onDismissed: (direction){

                        },
                        background: Container(
                          color: Colors.red,
                          width: 60,
                          padding: const EdgeInsets.all(10),
                          alignment: AlignmentDirectional.centerStart,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                            color: color.pinkColor,
                            width: 60,
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: ParagraphText('Remove', color: color.whiteColor,)
                        ),
                        child:    Column(
                          children: [
                            vSizedBox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    ParagraphText(promoList[index]['title'], color: color.primaryColor, ),
                                    ParagraphText(promoList[index]['date'], color: color.blackColor, fontSize: 13, ),
                                    ParagraphText(promoList[index]['time'], color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                                    ParagraphText(promoList[index]['location'] , color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                                  ],
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(promoList[index]['image'], height: 80, width: 130, fit: BoxFit.cover,))
                              ],
                            ),
                            vSizedBox10,
                            Divider(),

                          ],
                        ),),

                    );
                  }),

              ListView.builder(
                  itemCount: dealsList.length,
                  itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child:
                      Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.endToStart,
                        dragStartBehavior: DragStartBehavior.down,
                        movementDuration: Duration(seconds: 30),
                        onDismissed: (direction){

                        },
                        background: Container(
                          color: Colors.red,
                          width: 60,
                          padding: const EdgeInsets.all(10),
                          alignment: AlignmentDirectional.centerStart,
                          child: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        secondaryBackground: Container(
                            color: color.pinkColor,
                            width: 60,
                            padding: const EdgeInsets.all(20),
                            alignment: AlignmentDirectional.centerEnd,
                            child: ParagraphText('Remove', color: color.whiteColor,)
                        ),
                        child:    Column(
                          children: [
                            vSizedBox10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    ParagraphText(dealsList[index]['title'], color: color.primaryColor, ),
                                    ParagraphText(dealsList[index]['date'], color: color.blackColor, fontSize: 13, ),
                                    ParagraphText(dealsList[index]['time'], color: color.greyTextColor2, fontSize: 10, fontWeight: FontWeight.w400, ),
                                    ParagraphText(dealsList[index]['location'] , color: color.blackColor, fontSize: 11, fontWeight: FontWeight.w400, ),

                                  ],
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(dealsList[index]['image'], height: 80, width: 130, fit: BoxFit.cover,))
                              ],
                            ),
                            vSizedBox10,
                            Divider(),

                          ],
                        ),),

                    );
                  }),

              ],

          ),
        ),
      );
    });
  }
}
