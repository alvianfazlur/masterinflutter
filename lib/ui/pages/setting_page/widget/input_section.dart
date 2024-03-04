import 'package:flutter/material.dart';

import '../../../../shared/theme.dart';

class InputSection extends StatelessWidget {
  const InputSection(
      {Key? key,
      required this.textController,
      required this.title,
      required this.hintText,
      this.readOnly = false, required this.style,
      })
      : super(key: key);

  final TextEditingController textController;
  final String title;
  final String hintText;
  final bool readOnly;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackTextStyle,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          margin: EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            controller: textController,
            style: style,
            autofocus: false,
            readOnly: readOnly,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
