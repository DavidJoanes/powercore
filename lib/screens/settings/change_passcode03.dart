import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/constants.dart';

class ChangePasscode03 extends StatefulWidget {
  const ChangePasscode03(
      {super.key,
      required this.confirmPasscodeController,
      required this.fontStyle1a,
      required this.fontStyle1b});
  final TextEditingController confirmPasscodeController;
  final TextStyle fontStyle1a;
  final TextStyle fontStyle1b;

  @override
  State<ChangePasscode03> createState() => _ChangePasscode03State();
}

class _ChangePasscode03State extends State<ChangePasscode03> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  late var otpTextStyles = [
    createStyle(Colors.amber),
    createStyle(Colors.pink),
    createStyle(Colors.green),
    createStyle(Colors.orangeAccent),
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
                  "Confirm New Passcode",
                  style: widget.fontStyle1a,
                ),
                subtitle: Text(
                  "Verify your secuirty. Confirm your new passcode.",
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
                widget.confirmPasscodeController.text = currentPasscode;
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
