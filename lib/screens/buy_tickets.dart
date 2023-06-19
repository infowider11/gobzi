import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gobzi/constants/images_url.dart';
import 'package:gobzi/constants/sized_box.dart';
import 'package:gobzi/constants/toast.dart';
import 'package:gobzi/widgets/CustomTexts.dart';
import 'package:gobzi/widgets/custom_text_field.dart';
import 'package:gobzi/widgets/round_edged_button.dart';
import 'package:provider/provider.dart';

import '../constants/colorsmodal.dart';

class buy_tickets extends StatefulWidget {
  const buy_tickets({Key? key}) : super(key: key);

  @override
  State<buy_tickets> createState() => _buy_ticketsState();
}

class _buy_ticketsState extends State<buy_tickets> {
  int count = 0;
  TextEditingController card_no = TextEditingController();
  TextEditingController expiryDate = TextEditingController();
  TextEditingController cvvCode = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Consumer<MyColors> (builder: (context, color, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: color.primaryColor,)),
          title: ParagraphText('Buy Tickets', fontSize: 20, color: color.blackColor,),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ParagraphText('Ticket available: 46', fontSize: 15, color: color.primaryTextColor,),

              vSizedBox10,
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: color.buttonTabColor)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundEdgedButton(
                        text: '-',
                        fontSize: 25,
                        textColor: color.primaryColor,
                        color: color.textfieldColor,
                        border_color: color.buttonTabColor,
                        width: 70,
                        onTap: (){
                          if(count>0){
                            count--;
                          }
                          setState(() {});
                        },
                      ),
                      ParagraphText('$count', fontSize: 26, color: color.primaryTextColor,),
                      RoundEdgedButton(
                        text: '+',
                        fontSize: 25,
                        textColor: color.primaryColor,
                        color: color.textfieldColor,
                        border_color: color.buttonTabColor,
                        width: 70,
                        onTap: (){
                          if(count<10){
                            count++;
                          }else if(count==10){
                            toast('Maximum limit reached');
                          }
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ),
              vSizedBox10,
              ParagraphText('Payment Details', fontSize: 15, color: color.primaryColor,),
              vSizedBox10,
              CustomTextField(
                controller: card_no,
                hintText: '1234  5678  9101  1121',
                headingText: 'Card Number',
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextField(
                    controller: expiryDate,
                    hintText: 'MM/YY',
                    keyboardType: TextInputType.datetime,
                    headingText: 'Card Number',
                    width: MediaQuery.of(context).size.width/2.5,
                  ),
                  CustomTextField(
                    controller: cvvCode,
                    hintText: '123',
                    keyboardType: TextInputType.datetime,
                    headingText: 'CVV',
                    width: MediaQuery.of(context).size.width/2.5,
                  ),
                ],
              ),

              ParagraphText('Your personal data will be used to process your order, support your experience throughout this website,'
                  'and for other purposes described in our privacy policy.', fontSize: 11, fontWeight: FontWeight.w400, color: color.greyTextColor.withOpacity(0.5),),

              vSizedBox20,
              Center(child: ParagraphText('Total: \$45.00', fontSize: 21, color: color.blackColor,)),
              vSizedBox20,
              
              RoundEdgedButton(
                text: 'Confirm Payment',
                icon: MyImages.lock,
              )
            ],
          ),
        ),
      );
    });
  }
}
