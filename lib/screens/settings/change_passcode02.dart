import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/constants.dart';

class ChangePasscode02 extends StatefulWidget {
  const ChangePasscode02(
      {super.key,
      required this.newPasscodeController,
      required this.fontStyle1a,
      required this.fontStyle1b});
  final TextEditingController newPasscodeController;
  final TextStyle fontStyle1a;
  final TextStyle fontStyle1b;

  @override
  State<ChangePasscode02> createState() => _ChangePasscode02State();
}

class _ChangePasscode02State extends State<ChangePasscode02> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  late var otpTextStyles = [
    createStyle(Colors.lightGreen),
    createStyle(Colors.pink),
    createStyle(Colors.teal),
    createStyle(Colors.indigo),
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
                  "Create New Passcode",
                  style: widget.fontStyle1a,
                ),
                subtitle: Text(
                  "Secure your account. Create your new passcode now.",
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
            onSubmit: (String newPasscode) {
              setState(() {
                widget.newPasscodeController.text = newPasscode;
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
