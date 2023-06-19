import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/widgets/custom_text_field.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';
import '../constants/colorsmodal.dart';
import '../widgets/CustomTexts.dart';


class search_page extends StatefulWidget {
  const search_page({Key? key}) : super(key: key);

  @override
  State<search_page> createState() => _search_pageState();
}

class _search_pageState extends State<search_page> {
bool isSearch=false;
TextEditingController search = TextEditingController();
List searchList = [
  {'image' : MyImages.noti_banner, 'title' : 'Sam Smith: GLORIA The Tour', 'time':'Fri, April 30 - 9:00 PM - 10:00PM' , 'location':'Scotiabank Arena'},
  {'image' : MyImages.event2, 'title' : 'Jem: C21 Friday Night', 'time':'Fri, April 30 - 9:00 PM - 10:00PM' , 'location':'C21 Mall, MR9 road'},
];

  @override
  Widget build(BuildContext context) {
    int count = 0;
    for(int index = 0; index<searchList.length;index++){
            if(searchList[index]['title'].toLowerCase().contains(search.text) ||
                searchList[index]['time'].toLowerCase().contains(search.text) ||
                searchList[index]['location'].toLowerCase().contains(search.text) ){
              count++;
            }
    }

    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
          backgroundColor: color.whiteColor,
          appBar:
          isSearch == true?
          AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20, top: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color.textfieldColor
                    ),
                    child: TextField(
                      controller: search,
                      cursorColor: color.blackColor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 35),
                        hintText: 'Search here',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color.textfieldColor, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color.textfieldColor, width: 0.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: color.textfieldColor, width: 0.0),
                        ),
                      ),
                      onChanged: (text) {
                        setState(() {});
                      },
                    ),
                  ),
                  Positioned(
                      top: 12,
                      left: 5,
                      child: Icon(Icons.search, color: color.greyTextColor3,)),

                ],
              ),
            ),
            centerTitle: true,
            toolbarHeight: 70,
            backgroundColor: color.whiteColor,
            elevation: 0.0,
            leadingWidth: MediaQuery.of(context).size.width,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Column(
                children: [

                  Divider()
                ],
              ),
            ),
          ):
          AppBar(
            title: ParagraphText('Search', color: color.primaryTextColor, fontSize: 21,),
            centerTitle: true,
            backgroundColor: color.whiteColor,
            elevation: 0.0,
            toolbarHeight: 70,
            leading: Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: (){
                    _openBottomSheet(context);
                  },
                  child: Image.asset(MyImages.filter,  height: 20,)),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: Column(
                children: [
                  Divider()
                ],
              ),
            ),
            actions: [
              InkWell(
                onTap: (){
                  isSearch=true;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image.asset(MyImages.search, color: color.blackColor,),
                ),
              )
            ],
          ),


          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                vSizedBox10,
                ParagraphText('539 found', fontSize: 21, color: color.blackColor,),
                vSizedBox10,

                if(count==0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(MyImages.notFound),
                      ParagraphText('We’re sorry, there are no events listed under "${search.text}" Try searching something else.',
                        fontWeight: FontWeight.w400, color: color.blackColor, textAlign: TextAlign.center,),],
                  )else
                    Expanded(
                      child: GridView.builder(
                    itemCount: searchList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:  2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.82,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      if(searchList[index]['title'].toLowerCase().contains(search.text) ||
                          searchList[index]['time'].toLowerCase().contains(search.text) ||
                          searchList[index]['location'].toLowerCase().contains(search.text) ){
                        count++;
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: color.box1),
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(searchList[index]['image'], height: 120, fit: BoxFit.cover,)),
                                vSizedBox10,

                                Wrap(
                                  children: [
                                    SizedBox(
                                        width: 160,
                                        child: ParagraphText(searchList[index]['title'], overflow: TextOverflow.ellipsis, fontSize: 16, color: color.primaryTextColor,)),
                                  ],
                                ),

                                Wrap(
                                  children: [
                                    SizedBox(
                                        width: 160,
                                        child: ParagraphText(searchList[index]['time'],overflow: TextOverflow.ellipsis, fontSize: 11, fontWeight: FontWeight.w400, color: color.primaryColor,)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, color: color.primaryColor, size: 15,),
                                    hSizedBox05,
                                    Wrap(
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: ParagraphText(searchList[index]['location'], overflow: TextOverflow.ellipsis, fontSize: 11, fontWeight: FontWeight.w400, color: color.blackColor,)),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if(index==searchList.length-1 && count==0){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(MyImages.notFound),
                            ParagraphText('We’re sorry, there are no events listed under "${search.text}" Try searching something else.',
                              fontWeight: FontWeight.w400, color: color.blackColor,),

                          ],
                        );
                      }

                    },
                  ),
                ),

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
