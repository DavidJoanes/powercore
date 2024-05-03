import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:powercore/screens/home/home_frame.dart';
import 'package:powercore/screens/reset_passcode/reset_01.dart';

import '../../components/buttons.dart';
import '../../controllers/constants.dart';
import '../profile/edit_profile.dart';

class EnterOtpForLogin extends StatefulWidget {
  const EnterOtpForLogin({super.key});

  @override
  State<EnterOtpForLogin> createState() => _EnterOtpForLoginState();
}

class _EnterOtpForLoginState extends State<EnterOtpForLogin> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();
  int trials = 3;

  @override
  void initState() {
    userInfo.writeIfNull("passCode", "");
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
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500, color: constantValues.primaryColor));
    final fontStyle1c = GoogleFonts.poppins(textStyle: const TextStyle());
    final fontStyle1d1 = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.successColor, fontWeight: FontWeight.w600));
    final fontStyle1d2 = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.errorColor, fontWeight: FontWeight.w600));
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
          "Log In",
          style: fontStyle1,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(children: [
            userInfo.read("passCode") == ""
                ? SizedBox(
                    height: size.height * 0.05,
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                      child: Text(
                        "Forgot Passcode?",
                        style: fontStyle1b,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Reset Passcode"),
                                content: SizedBox(
                                  height: size.height * 0.11,
                                  child: Column(
                                    children: [
                                      const Text(
                                          "We will send you a link to reset your passcode via mail. Wish to proceed?"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                "No",
                                                style: TextStyle(
                                                    color: constantValues
                                                        .errorColor),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return const AlertDialog(
                                                        title: Text(
                                                            "Reset Passcode Link Sent"),
                                                        content: Text(
                                                            "Please, click on the link in the mail you've just received."),
                                                      );
                                                    });
                                                Get.to(const ResetPasscode(
                                                    id: "1"));
                                              },
                                              child: Text(
                                                "Proceed",
                                                style: TextStyle(
                                                    color: constantValues
                                                        .primaryColor),
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
                  ]),
            SizedBox(
                width: size.width * 0.9,
                child: ListTile(
                  title: Text(
                    userInfo.read("passCode") == ""
                        ? "OTP"
                        : "Enter your passcode",
                    style: fontStyle1a,
                  ),
                  subtitle: Text(
                    userInfo.read("passCode") == ""
                        ? "We've sent you an otp via mail. Please, fill it in here to gain access."
                        : "Enter your secure passcode to login.",
                    style: fontStyle1c,
                  ),
                )),
            SizedBox(
              height: size.height * 0.04,
            ),
            OtpTextField(
              numberOfFields: userInfo.read("passCode") == "" ? 6 : 4,
              borderColor: constantValues.primaryColor,
              obscureText: true,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                if (userInfo.read("passCode") == "") {
                  if (verificationCode == "222222") {
                    Future.delayed(const Duration(seconds: 1), () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return LoadingAnimationWidget.threeArchedCircle(
                              color: constantValues.successColor,
                              size: size.width * 0.15,
                            );
                          });
                    });
                  } else {
                    Get.snackbar("Invalid OTP",
                        "Please, provide the correct otp you received!",
                        titleText: Text(
                          "Invalid OTP",
                          style: fontStyle1d2,
                        ));
                  }
                } else {
                  setState(() {
                    trials--;
                  });
                  if (verificationCode == userInfo.read("passCode")) {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return LoadingAnimationWidget.threeArchedCircle(
                            color: constantValues.successColor,
                            size: size.width * 0.15,
                          );
                        });
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.back();
                      Get.off(const HomeFrame());
                      Get.snackbar("Passcode Success",
                          "Welcome back, ${constantValues.lName.capitalizeFirst}.",
                          titleText: Text(
                            "Passcode Success",
                            style: fontStyle1d1,
                          ));
                      userInfo.read("phoneNumber") == "" ||
                              userInfo.read("address") == ""
                          ? showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text(
                                    "Complete your profile setup?",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 20)),
                                    textAlign: TextAlign.center,
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ButtonA(
                                          width: 100,
                                          borderColor:
                                              constantValues.transparentColor,
                                          bgColor:
                                              constantValues.transparentColor,
                                          textColor: constantValues.whiteColor,
                                          text: "Skip",
                                          authenticate: () {
                                            Get.back();
                                          }),
                                      ButtonA(
                                          width: 100,
                                          borderColor:
                                              constantValues.transparentColor,
                                          bgColor: constantValues.primaryColor,
                                          textColor: constantValues.whiteColor,
                                          text: "Yes",
                                          authenticate: () {
                                            Get.off(const EditProfile());
                                          }),
                                    ],
                                  ),
                                );
                              })
                          : const SizedBox();
                    });
                  } else {
                    Get.snackbar("Passcode Errror",
                        "The passcode you entered is invalid!\nYour account will be locked after $trials more attempts.",
                        titleText: Text(
                          "Passcode Error",
                          style: fontStyle1d2,
                        ));
                  }
                }
              },
            ),
            SizedBox(
              height: size.height * 0.52,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "I didn't recieve a mail",
                  style: fontStyle1d2,
                ))
          ]),
        ),
      ),
    );
  }
}
