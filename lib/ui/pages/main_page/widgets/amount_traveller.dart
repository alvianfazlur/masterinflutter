import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/controller/homepage_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AmountTravellerInput extends StatelessWidget {
  const AmountTravellerInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => GestureDetector(
        onTap: (){
          Get.dialog(
            Material(
              type: MaterialType.transparency,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    color: whiteColor,
                  ),
                  child: Column(
                    children: [
                      Text("Add Traveller", style: blackTextStyle.copyWith(fontSize: 20, fontWeight: extraBold)),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              controller.subtractTraveller();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage("assets/images/minus.png"))
                              ),
                            ),
                          ),
                          SizedBox(width: 30,),
                          Obx(() => Text("${controller.traveller} Person", style: TextStyle(fontSize: 20))),
                          SizedBox(width: 30,),
                          GestureDetector(
                            onTap: (){
                              controller.addTraveller();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage("assets/images/plus.png"))
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );

        },
        child: Container(
          margin: EdgeInsets.only(top: 10),
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(color: greyColor.withOpacity(0.2),),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 22),
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/group_fill.png"))
                ),
              ),
              SizedBox(width: 10),
              Text("${controller.traveller} Person", style: blackTextStyle.copyWith(fontWeight: semiBold),),
            ],
          ),
        ),
      ),
    );
  }
}
