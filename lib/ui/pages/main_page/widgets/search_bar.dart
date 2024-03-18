import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/homepage_controller.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) => Container(
        height: 50,
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: greyColor.withOpacity(0.2))),
        child: TextFormField(
          style: blackTextStyle,
          onChanged: (value) {
            controller.updateList(value);
          },
          focusNode: controller.searchPlaceFocus,
          autofocus: false,
          controller: controller.search,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            icon: Image.asset(
              'assets/images/map_pin.png',
            ),
            border: InputBorder.none,
            hintText: "Location",
            hintStyle: greyTextStyle.copyWith(
                fontWeight: light, color: greyHintTextColor, fontSize: 15),
            suffixIcon: controller.search.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.clearSearch();
                      controller.updateList(controller.search.text);
                    },
                    icon: const Icon(Icons.highlight_remove_rounded),
                  )
                : SizedBox()
          ),
        ),
      ),
    );
  }
}
