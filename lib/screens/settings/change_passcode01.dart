import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/constants.dart';

class ChangePasscode01 extends StatefulWidget {
  const ChangePasscode01(
      {super.key,
      required this.currentPasscodeController,
      required this.fontStyle1a,
      required this.fontStyle1b});
  final TextEditingController currentPasscodeController;
  final TextStyle fontStyle1a;
  final TextStyle fontStyle1b;

  @override
  State<ChangePasscode01> createState() => _ChangePasscode01State();
}

class _ChangePasscode01State extends State<ChangePasscode01> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  late var otpTextStyles = [
    createStyle(Colors.blue),
    createStyle(Colors.yellow),
    createStyle(Colors.deepOrange),
    createStyle(Colors.cyan),
  ];

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.displaySmall?.copyWith(color: color);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          SizedBox(
              width: size.width * 0.9,
              child: ListTile(
                title: Text(
                  "Enter Passcode",
                  style: widget.fontStyle1a,
                ),
                subtitle: Text(
                  "To change your passcode, please enter your current passcode for authentication.",
                  style: widget.fontStyle1b,
                ),
              )),
          SizedBox(
            height: size.height * 0.04,
          ),
          OtpTextField(
            numberOfFields: 4,
            borderColor: constantValues.primaryColor,
            styles: otpTextStyles,
            obscureText: true,
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String currentPasscode) {
              setState(() {
                widget.currentPasscodeController.text = currentPasscode;
              });
            },
          ),
          SizedBox(
            height: size.height * 0.6,
          ),
        ],
      ),
    );
  }
}
