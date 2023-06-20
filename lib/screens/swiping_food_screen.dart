import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipe_cards/swipe_cards.dart';
// import 'package:swiping_card_deck/swiping_card_deck.dart';
import '../constants/colorsmodal.dart';
import '../constants/images_url.dart';
import '../constants/sized_box.dart';
import '../functions/responsive.dart';
import '../widgets/CustomTexts.dart';


class swiping_food_screen extends StatefulWidget {
  const swiping_food_screen({Key? key}) : super(key: key);

  @override
  State<swiping_food_screen> createState() => _swiping_food_screenState();
}

class _swiping_food_screenState extends State<swiping_food_screen> {
  List swipeFood = [
    {'image':MyImages.food1, 'name': "Scotiabank Arena", 'location': '5.2 kilometres away', },
    {'image':MyImages.food2,  'name': "Popeyes Chicken", 'location': '3.2 kilometres away', },
    {'image':MyImages.food3,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
    {'image':MyImages.food4,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
    {'image':MyImages.food5,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
    {'image':MyImages.food6,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
    {'image':MyImages.food7,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
    {'image':MyImages.food8,  'name': "Marble Slab", 'location': '6.2 kilometres away', },
  ];
  MatchEngine? _matchEngine;
  List<SwipeItem> _swipeItems = <SwipeItem>[];


  @override
  void initState() {
    super.initState();

    for (int i = 0; i < swipeFood.length; i++)
      _swipeItems.add(SwipeItem(content: swipeFood[i]));

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmallDevice(context) ? MediaQuery.of(context).size.height / 1.52 : MediaQuery.of(context).size.height / 1.47,
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
                          height: isSmallDevice(context) ? MediaQuery.of(context).size.height / 1.52 : MediaQuery.of(context).size.height / 1.47,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                swipeFood[index]['image'], fit: BoxFit.cover,)),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Container(
                            height: 70,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width / 1.1,
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
                                    swipeFood[index]['name'], fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: color.primaryColor,),
                                  ParagraphText(
                                    swipeFood[index]['location'], fontSize: 13,
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
              content: Text("No Food Present"),
              duration: Duration(milliseconds: 500),
            ));
          },
        ),
    );
    // SwipingCardDeck(
    //   cardDeck: <Card>[
    //     for (int index = 0; index < swipeFood.length; index++)
    //       Card(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)),
    //           elevation: 0,
    //           child: GestureDetector(
    //             onTap: (){
    //               // push(context: context, screen: event_details());
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
    //
    //                     ),
    //                     child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(10),
    //                         child: Image.asset(
    //                           swipeFood[index]['image'], fit: BoxFit.cover,)),
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
    //                               swipeFood[index]['name'], fontSize: 16,
    //                               fontWeight: FontWeight.w600,
    //                               color: color.primaryColor,),
    //                             ParagraphText(
    //                               swipeFood[index]['location'], fontSize: 13,
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
    //     swipeFood.removeAt(0);
    //     setState(() {});
    //   },
    //   onRightSwipe: (Card card) {
    //     print('right swiped');
    //     swipeFood.removeAt(0);
    //     setState(() {});
    //   },
    //   swipeThreshold: MediaQuery.of(context).size.width / 2,
    //   minimumVelocity: 1000,
    //   cardWidth: 340,
    //   swipeAnimationDuration: const Duration(milliseconds: 500),
    // );
  }
}
