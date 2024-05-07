// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/buttons.dart';
import 'change_passcode02.dart';
import 'change_passcode03.dart';

class ChangePasscode_ extends StatefulWidget {
  const ChangePasscode_({super.key});

  @override
  State<ChangePasscode_> createState() => _ChangePasscode_State();
}

class _ChangePasscode_State extends State<ChangePasscode_> {
  final PageController _controller = PageController();
  int currentPage = 0;
  bool isLastPage = false;
  int trials = 3;
  TextEditingController currentPasscodeController = TextEditingController();
  TextEditingController newPasscodeController = TextEditingController();
  TextEditingController confirmPasscodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    currentPasscodeController.dispose();
    newPasscodeController.dispose();
    confirmPasscodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500, fontSize: size.width * 0.06));
    final fontStyle1b = GoogleFonts.poppins(textStyle: const TextStyle());
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.errorColor, fontWeight: FontWeight.w600));
    final fontStyle1d = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.successColor, fontWeight: FontWeight.w600));
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
      ),
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  isLastPage = (index == 1);
                });
              },
              children: [
                ChangePasscode02(
                  newPasscodeController: newPasscodeController,
                  fontStyle1a: fontStyle1a,
                  fontStyle1b: fontStyle1b,
                ),
                ChangePasscode03(
                  confirmPasscodeController: confirmPasscodeController,
                  fontStyle1a: fontStyle1a,
                  fontStyle1b: fontStyle1b,
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(),
                      SizedBox(height: size.height * 0.55),
                      isLastPage
                          ? ButtonA(
                              width: size.width * 0.9,
                              borderColor: constantValues.transparentColor,
                              bgColor: constantValues.primaryColor,
                              textColor: constantValues.whiteColor,
                              text: "Complete",
                              authenticate: () {
                                if (confirmPasscodeController.text ==
                                    userInfo.read("tempPassCode")) {
                                  setState(() {
                                    userInfo.write("passCode",
                                        confirmPasscodeController.text.trim());
                                    userInfo.write("tempPassCode", "");
                                  });
                                  Get.back();
                                  Get.snackbar(
                                    "Passcode Success",
                                    "Passcode modified successfully..",
                                    titleText: Text(
                                      "Passcode Success",
                                      style: fontStyle1d,
                                    ),
                                  );
                                } else {
                                  Get.snackbar(
                                    "Passcode Error",
                                    "Passcode does not match!",
                                    titleText: Text(
                                      "Passcode Error",
                                      style: fontStyle1c,
                                    ),
                                  );
                                }
                              })
                          : ButtonA(
                              width: size.width * 0.9,
                              borderColor: constantValues.transparentColor,
                              bgColor: constantValues.primaryColor,
                              textColor: constantValues.whiteColor,
                              text: "Continue",
                              authenticate: () {
                                if (currentPage == 0) {
                                  if (newPasscodeController.text != "") {
                                    setState(() {
                                      userInfo.write("tempPassCode",
                                          newPasscodeController.text.trim());
                                    });
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeIn);
                                  }
                                }
                              })
                    ]))
          ],
        ),
      ),
    );
  }
}
