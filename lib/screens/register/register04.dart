import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../controllers/constants.dart';

class EnterOtpForRegistration extends StatefulWidget {
  const EnterOtpForRegistration(
      {super.key,
      required this.otpController,
      required this.fontStyle1c,
      required this.fontStyle1d});
  final TextEditingController otpController;
  final TextStyle fontStyle1c;
  final TextStyle fontStyle1d;

  @override
  State<EnterOtpForRegistration> createState() =>
      _EnterOtpForRegistrationState();
}

class _EnterOtpForRegistrationState extends State<EnterOtpForRegistration> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // widget.otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        SizedBox(
            width: size.width * 0.9,
            child: ListTile(
              title: Text(
                "OTP",
                style: widget.fontStyle1c,
              ),
              subtitle: Text(
                "We sent you an otp. Please, fill it in here in order to confirm your email.",
                style: widget.fontStyle1d,
              ),
            )),
        SizedBox(
          height: size.height * 0.04,
        ),
        OtpTextField(
          numberOfFields: 6,
          borderColor: constantValues.primaryColor,
          showFieldAsBox: true,
          onCodeChanged: (String code) {},
          onSubmit: (String verificationCode) {
            setState(() {
              widget.otpController.text = verificationCode;
            });
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //       return AlertDialog(
            //         title: const Text("Verification Code"),
            //         content: Text('Code entered is $verificationCode'),
            //       );
            //     });
          },
        ),
        SizedBox(
          height: size.height * 0.6,
        ),
      ]),
    );
  }
}
