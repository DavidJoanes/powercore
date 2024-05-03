import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/constants.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class TextFieldContainer extends StatelessWidget {
  final double width;
  final Widget child;
  // final Color borderColor;
  const TextFieldContainer({
    super.key,
    required this.width,
    required this.child,
    // required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      width: width,
      decoration: BoxDecoration(
        color: userInfo.read("isDarkTheme")
            ? constantValues.blackColor2
            : constantValues.greyColor2,
        borderRadius: BorderRadius.circular(5),
        // border: Border.all(color: Colors.grey, width: 1),
      ),
      child: child,
    );
  }
}
