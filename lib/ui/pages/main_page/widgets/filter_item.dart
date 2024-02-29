import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterItem extends StatelessWidget {
  FilterItem({Key? key, required this.controller, required this.category})
      : super(key: key);

  final HomePageController controller;
  final String category;

  @override
  Widget build(BuildContext context) {
    RxBool isSelected = controller.isSelected(category).obs;

    return GetBuilder<HomePageController>(
      builder: (HomePageController controller) {
        return Obx(() => Container(
          margin: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if(isSelected.value == true){
                    isSelected.value = false;
                    controller.selectCategory("");
                    controller.filterList("");
                  }
                  else{
                    controller.selectCategory(category);
                    controller.filterList(category);
                  }
                },
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 20, right: 10),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        border: Border.all(
                          color: isSelected.value
                              ? Colors.blue
                              : greyColor.withOpacity(0.3),
                        ),
                        borderRadius: BorderRadius.circular(7)),
                    child: Text(
                      category.isEmpty ? "SEMUA" : category.toUpperCase(),
                      style: blackTextStyle,
                    )),
              )
            ],
          ),
        ));
      },
    );
  }
}
