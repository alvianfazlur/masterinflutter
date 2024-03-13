import 'package:bwa_masteringflutter/shared/theme.dart';
import 'package:bwa_masteringflutter/ui/pages/main_page/destination_controller/homepage_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomePageController>(
      builder: (controller) => Container(
        padding: EdgeInsets.only(left: 10, right: 5),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
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
            border: InputBorder.none,
            hintText: "Search...",
            hintStyle: greyTextStyle.copyWith(fontWeight: light, color: greyHintTextColor, fontSize: 15),
            suffixIcon: controller.search.text.isNotEmpty
                ? IconButton(
              onPressed: () {
                controller.clearSearch();
                controller.updateList(controller.search.text);
              },
              icon: const Icon(Icons.highlight_remove_rounded),
            )
                : IconButton(
              onPressed: () {
                controller.updateList(controller.search.text);
              },
              icon: const Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
