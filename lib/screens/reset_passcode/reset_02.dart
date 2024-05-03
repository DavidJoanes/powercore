import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:powercore/screens/login/login01.dart';

import '../../controllers/constants.dart';

class ResetConfirmPasscode extends StatefulWidget {
  const ResetConfirmPasscode({super.key});

  @override
  State<ResetConfirmPasscode> createState() => _ResetConfirmPasscodeState();
}

class _ResetConfirmPasscodeState extends State<ResetConfirmPasscode> {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: size.width * 0.06));
    final fontStyle1b = GoogleFonts.poppins(textStyle: const TextStyle());
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: TextStyle(color: constantValues.successColor));
    final fontStyle1d = GoogleFonts.poppins(
        textStyle: TextStyle(color: constantValues.errorColor));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            CupertinoIcons.back,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          "Reset Passcode",
          style: fontStyle1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
                width: size.width * 0.9,
                child: ListTile(
                  title: Text(
                    "Confirm new passcode",
                    style: fontStyle1a,
                  ),
                  subtitle: Text(
                    "Confirm your new secure passcode.",
                    style: fontStyle1b,
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
              onSubmit: (String confirmNewPasscode) {
                if (confirmNewPasscode == constantValues.tempResetPasscode) {
                  setState(() {
                    userInfo.write("passCode", confirmNewPasscode);
                  });
                  // showDialog(
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (context) {
                  //       return LoadingAnimationWidget.threeArchedCircle(
                  //         color: constantValues.successColor,
                  //         size: size.width * 0.15,
                  //       );
                  //     });
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Passcode Reset Success",
                            style: fontStyle1c,
                          ),
                          content: SizedBox(
                              height: size.height * 0.08,
                              child: Column(
                                children: [
                                  Text(
                                    "Passcode reset successfully..",
                                    style: fontStyle1b,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Get.off(const Login());
                                          },
                                          child: Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: constantValues
                                                    .primaryColor),
                                          ))
                                    ],
                                  )
                                ],
                              )),
                        );
                      });
                } else {
                  Get.snackbar(
                      "Passcode Reset Error", "Passcode does not match!",
                      titleText: Text(
                        "Invalid Error",
                        style: fontStyle1d,
                      ));
                }
              },
            ),
            SizedBox(
              height: size.height * 0.6,
            ),
          ]),
        ),
      ),
    );
  }
}
