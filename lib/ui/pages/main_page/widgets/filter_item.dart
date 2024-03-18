import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/homepage_controller.dart';

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
                    height: 50,
                    decoration: BoxDecoration(
                        color: isSelected.value?
                        selectedFilterColor : Colors.transparent,
                        border: Border.all(
                          color: selectedFilterColor,
                        ),
                        borderRadius: BorderRadius.circular(12)),
                    child: Text(
                      category,
                      style: isSelected.value? whiteTextStyle.copyWith(fontWeight: medium) : greyTextStyle.copyWith(color: Color(0xffA098D0)),
                    )),
              )
            ],
          ),
        ));
      },
    );
  }
}
