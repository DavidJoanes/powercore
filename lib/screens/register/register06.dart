import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/constants.dart';

class EnterConfirmPasscode extends StatefulWidget {
  const EnterConfirmPasscode(
      {super.key,
      required this.confirmPasscodeController,
      required this.fontStyle1c,
      required this.fontStyle1d});
  final TextEditingController confirmPasscodeController;
  final TextStyle fontStyle1c;
  final TextStyle fontStyle1d;

  @override
  State<EnterConfirmPasscode> createState() => _EnterConfirmPasscodeState();
}

class _EnterConfirmPasscodeState extends State<EnterConfirmPasscode> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  late var otpTextStyles = [
    createStyle(Colors.red),
    createStyle(Colors.lightBlueAccent),
    createStyle(Colors.lime),
    createStyle(Colors.brown),
  ];

  TextStyle? createStyle(Color color) {
    ThemeData theme = Theme.of(context);
    return theme.textTheme.displaySmall?.copyWith(color: color);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // widget.confirmPasscodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(children: [
        SizedBox(
          height: size.height * 0.07,
        ),
        SizedBox(
            width: size.width * 0.9,
            child: ListTile(
              title: Text(
                "Confirm Passcode",
                style: widget.fontStyle1c,
              ),
              subtitle: Text(
                "Verify your security, confirm your passcode.",
                style: widget.fontStyle1d,
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
          onSubmit: (String confirmPasscode) {
            setState(() {
              widget.confirmPasscodeController.text = confirmPasscode;
            });
          },
        ),
        SizedBox(
          height: size.height * 0.6,
        ),
      ]),
    );
  }
}
