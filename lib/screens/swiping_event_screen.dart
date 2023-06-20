import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
// import 'package:swiping_card_deck/swiping_card_deck.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../constants/sized_box.dart';
import '../functions/navigation_functions.dart';
import '../functions/responsive.dart';
import '../widgets/CustomTexts.dart';
import 'event_details.dart';


class swiping_event_screen extends StatefulWidget {
  const swiping_event_screen({Key? key}) : super(key: key);

  @override
  State<swiping_event_screen> createState() => _swiping_event_screenState();
}

class _swiping_event_screenState extends State<swiping_event_screen> {
  List swipeEvents = [
    {'image':MyImages.event1, 'name': "Scotiabank Arena", 'location': '5.2 kilometres away', },
    {'image':MyImages.event2,  'name': "Popeyes Chicken", 'location': '3.2 kilometres away', },
    {'image':MyImages.event3,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
  ];
  MatchEngine? _matchEngine;
  List<SwipeItem> _swipeItems = <SwipeItem>[];


  @override
  void initState() {
    super.initState();

    for (int i = 0; i < swipeEvents.length; i++)
      _swipeItems.add(SwipeItem(content: swipeEvents[i]));

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallDevice(context) ? MediaQuery.of(context).size.height/1.52 : MediaQuery.of(context).size.height/1.47,
      child: SwipeCards(
          matchEngine: _matchEngine!,
          itemBuilder: (BuildContext context, int index) {
            return  Consumer<MyColors> (builder: (context, color, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Card(
                    child: Stack(
                      children: [
                        Container(
                          height: isSmallDevice(context) ? MediaQuery.of(context).size.height/1.52 : MediaQuery.of(context).size.height/1.47,
                          width: MediaQuery.of(context).size.width/1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                swipeEvents[index]['image'], fit: BoxFit.cover,)),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width/1.1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)),
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
                                  child: Image.asset(
                                    MyImages.event_logo, height: 55,)),

                              hSizedBox10,

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ParagraphText(
                                    swipeEvents[index]['name'], fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: color.primaryColor,),
                                  ParagraphText(
                                    swipeEvents[index]['location'], fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: color.greyTextColor,),
                                ],
                              ),

                              hSizedBox60,

                              Icon(CupertinoIcons.heart_fill,
                                color: color.greyColor,),
                              hSizedBox10,
                              Icon(Icons.info_outline, color: color.greyColor,)
                            ],
                          ),
                        )

                      ],
                    )
                ),
              );
            });
          },
          leftSwipeAllowed: true,
          rightSwipeAllowed: true,
          upSwipeAllowed: true,
          fillSpace: true,
          onStackFinished: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("No Event Present"),
              duration: Duration(milliseconds: 500),
            ));
          },
        ),
    );
      // SwipingCardDeck(
      //   cardDeck: <Card>[
      //     for (int index = 0; index < swipeEvents.length; index++)
      //       Card(
      //           shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10)),
      //           elevation: 0,
      //           child: GestureDetector(
      //             onTap: (){
      //               push(context: context, screen: event_details());
      //             },
      //             child: Consumer<MyColors> (builder: (context, color, child) {
      //               return Stack(
      //                 children: [
      //
      //
      //                   Container(
      //                     height: isSmallDevice(context) ? MediaQuery.of(context).size.height/1.52 : MediaQuery.of(context).size.height/1.47,
      //                     width: MediaQuery.of(context).size.width/1.1,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(10),
      //                     ),
      //                     child: ClipRRect(
      //                         borderRadius: BorderRadius.circular(10),
      //                         child: Image.asset(
      //                           swipeEvents[index]['image'], fit: BoxFit.cover,)),
      //                   ),
      //                   Positioned(
      //                     bottom: 0,
      //                     left: 0,
      //                     child: Container(
      //                       height: 70,
      //                       width: MediaQuery.of(context).size.width/1.1,
      //                       decoration: BoxDecoration(
      //                           borderRadius: BorderRadius.only(
      //                               topLeft: Radius.circular(30),
      //                               topRight: Radius.circular(30)),
      //                           color: color.whiteColor.withOpacity(0.9)
      //                       ),
      //                     ),
      //                   ),
      //                   Positioned(
      //                     bottom: 5,
      //                     left: 10,
      //                     child: Row(
      //                       crossAxisAlignment: CrossAxisAlignment.center,
      //                       children: [
      //                         ClipRRect(
      //                             borderRadius: BorderRadius.circular(100),
      //                             child: Image.asset(
      //                               MyImages.event_logo, height: 55,)),
      //
      //                         hSizedBox10,
      //
      //                         Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             ParagraphText(
      //                               swipeEvents[index]['name'], fontSize: 16,
      //                               fontWeight: FontWeight.w600,
      //                               color: color.primaryColor,),
      //                             ParagraphText(
      //                               swipeEvents[index]['location'], fontSize: 13,
      //                               fontWeight: FontWeight.w400,
      //                               color: color.greyTextColor,),
      //                           ],
      //                         ),
      //
      //                         hSizedBox60,
      //
      //                         Icon(CupertinoIcons.heart_fill,
      //                           color: color.greyColor,),
      //                         hSizedBox10,
      //                         Icon(Icons.info_outline, color: color.greyColor,)
      //                       ],
      //                     ),
      //                   )
      //
      //                 ],
      //               );
      //             }),
      //           )
      //       ),
      //   ],
      //   onDeckEmpty: () {
      //     print("Card deck empty");
      //
      //   },
      //   onLeftSwipe: (Card card) {
      //     print('left swiped');
      //     swipeEvents.removeAt(0);
      //     setState(() {});
      //   },
      //   onRightSwipe: (Card card) {
      //     print('right swiped');
      //     swipeEvents.removeAt(0);
      //     setState(() {});
      //   },
      //   swipeThreshold: MediaQuery.of(context).size.width / 2,
      //   minimumVelocity: 1000,
      //   cardWidth: 340,
      //   swipeAnimationDuration: const Duration(milliseconds: 500),
      // );
  }
}
