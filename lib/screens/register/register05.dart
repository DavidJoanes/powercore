import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/constants.dart';
import '../login/login01.dart';

class EnterPasscode extends StatefulWidget {
  const EnterPasscode(
      {super.key,
      required this.passcodeController,
      required this.fontStyle1a,
      required this.fontStyle1c,
      required this.fontStyle1d});
  final TextEditingController passcodeController;
  final TextStyle fontStyle1a;
  final TextStyle fontStyle1c;
  final TextStyle fontStyle1d;

  @override
  State<EnterPasscode> createState() => _EnterPasscodeState();
}

class _EnterPasscodeState extends State<EnterPasscode> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  late var otpTextStyles = [
    createStyle(Colors.purple),
    createStyle(Colors.greenAccent),
    createStyle(Colors.orange),
    createStyle(Colors.pink),
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
    // widget.passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.successColor, fontWeight: FontWeight.w600));
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              child: Text(
                "Skip",
                style: widget.fontStyle1a,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Info"),
                        content: SizedBox(
                          height: size.height * 0.14,
                          child: Column(
                            children: [
                              const Text(
                                  'Skipping this process automatically means you will be required to login everytime using an otp. Wish to continue?'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        "No",
                                        style: TextStyle(
                                            color: constantValues.errorColor),
                                      )),
                                  TextButton(
                                      onPressed: () {
                                        userInfo.write("isNewUser", false);
                                        userInfo.write("passCode", "");
                                        Get.back();
                                        Get.snackbar(
                                          "Registration Success",
                                          "Welcome onboard!",
                                          titleText: Text(
                                            "Registration Success",
                                            style: fontStyle1a,
                                          ),
                                        );
                                        Get.off(const Login());
                                      },
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: constantValues.primaryColor),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
            ),
          ],
        ),
        SizedBox(
            width: size.width * 0.9,
            child: ListTile(
              title: Text(
                "Create Passcode",
                style: widget.fontStyle1c,
              ),
              subtitle: Text(
                "Secure your account locally by creating your passcode.",
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
          onSubmit: (String passCode) {
            setState(() {
              widget.passcodeController.text = passCode;
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
