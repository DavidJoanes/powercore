import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/screens/login/login01.dart';
import 'package:powercore/screens/register/register01.dart';
import 'package:powercore/screens/register/register02.dart';
import 'package:powercore/screens/register/register03.dart';
import 'package:powercore/screens/register/register04.dart';

import '../../components/buttons.dart';
import '../../controllers/constants.dart';
import 'register05.dart';
import 'register06.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final PageController _controller = PageController();
  int currentPage = 0;
  bool isLastPage = false;
  TextEditingController powercellIDController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController passcodeController = TextEditingController();
  TextEditingController confirmPasscodeController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    powercellIDController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    otpController.dispose();
    passcodeController.dispose();
    confirmPasscodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, fontSize: size.width * 0.04));
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: size.width * 0.05));
    final fontStyle1d = GoogleFonts.poppins(textStyle: const TextStyle());
    final fontStyle1e = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.errorColor, fontWeight: FontWeight.w600));
    final fontStyle1f = GoogleFonts.poppins(
        textStyle: TextStyle(
            color: constantValues.successColor, fontWeight: FontWeight.w600));
    final fontStyle2a = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w200,
            color: userInfo.read("isDarkTheme")
                ? constantValues.whiteColor
                : constantValues.blackColor));
    final fontStyle2b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w200,
            color: userInfo.read("isDarkTheme")
                ? constantValues.whiteColor
                : constantValues.blackColor,
            decoration: TextDecoration.underline));
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
            "Create Account",
            style: fontStyle1a,
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
                  isLastPage = (index == 5);
                });
              },
              children: [
                EnterPowercellID(
                  formKey: _formKey1,
                  powercellIDController: powercellIDController,
                  fontStyle1b: fontStyle1b,
                ),
                EnterFullName(
                  formKey: _formKey2,
                  firstnameController: firstnameController,
                  lastnameController: lastnameController,
                  fontStyle1c: fontStyle1c,
                  fontStyle1d: fontStyle1d,
                ),
                EnterEmailAddress(
                    formKey: _formKey3,
                    emailController: emailController,
                    fontStyle1c: fontStyle1c,
                    fontStyle1d: fontStyle1d),
                EnterOtpForRegistration(
                    otpController: otpController,
                    fontStyle1c: fontStyle1c,
                    fontStyle1d: fontStyle1d),
                EnterPasscode(
                    passcodeController: passcodeController,
                    fontStyle1a: fontStyle1a,
                    fontStyle1c: fontStyle1c,
                    fontStyle1d: fontStyle1d),
                EnterConfirmPasscode(
                    confirmPasscodeController: confirmPasscodeController,
                    fontStyle1c: fontStyle1c,
                    fontStyle1d: fontStyle1d),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  currentPage != 4 ? const SizedBox() : const Text("."),
                  currentPage == 0
                      ? SizedBox(height: size.height * 0.3)
                      : SizedBox(height: size.height * 0.35),
                  isLastPage
                      ? ButtonA(
                          width: size.width * 0.9,
                          borderColor: constantValues.transparentColor,
                          bgColor: constantValues.primaryColor,
                          textColor: constantValues.whiteColor,
                          text: "Complete",
                          authenticate: () {
                            if (confirmPasscodeController.text ==
                                userInfo.read("passCode")) {
                              setState(() {
                                userInfo.write("isNewUser", false);
                              });
                              Get.snackbar(
                                "Passcode Success",
                                "Passcode created successfully..\nWelcome onboard!",
                                titleText: Text(
                                  "Passcode Success",
                                  style: fontStyle1f,
                                ),
                              );
                              Get.off(const Login());
                            } else {
                              Get.snackbar(
                                  "Passcode Error", "Passcode does not match!",
                                  titleText: Text(
                                    "Passcode Error",
                                    style: fontStyle1e,
                                  ),);
                            }
                          })
                      : Column(
                          children: [
                            ButtonA(
                                width: size.width * 0.9,
                                borderColor: constantValues.transparentColor,
                                bgColor: constantValues.primaryColor,
                                textColor: constantValues.whiteColor,
                                text: "Continue",
                                authenticate: () {
                                  if (currentPage == 0) {
                                    final form1 = _formKey1.currentState!;
                                    if (form1.validate()) {
                                      setState(() {
                                        userInfo.write("powercellID",
                                            powercellIDController.text.trim());
                                      });
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    }
                                  }
                                  if (currentPage == 1) {
                                    final form2 = _formKey2.currentState!;
                                    if (form2.validate()) {
                                      setState(() {
                                        userInfo.write(
                                            "firstName",
                                            firstnameController.text
                                                .toLowerCase()
                                                .trim());
                                      });
                                      setState(() {
                                        userInfo.write(
                                            "lastName",
                                            lastnameController.text
                                                .toLowerCase()
                                                .trim());
                                      });
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    }
                                  }
                                  if (currentPage == 2) {
                                    final form3 = _formKey3.currentState!;
                                    if (form3.validate()) {
                                      setState(() {
                                        userInfo.write(
                                            "emailAddress",
                                            emailController.text
                                                .toLowerCase()
                                                .trim());
                                      });
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    }
                                  }
                                  if (currentPage == 3) {
                                    if (otpController.text != "") {
                                      setState(() {
                                        userInfo.write(
                                            "otp", otpController.text.trim());
                                      });
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    } else {
                                      Get.snackbar(
                                          "OTP Error", "OTP cannot be blank!",
                                          titleText: Text(
                                            "OTP Error",
                                            style: fontStyle1e,
                                          ),
                                          snackPosition: SnackPosition.TOP);
                                    }
                                  }
                                  if (currentPage == 4) {
                                    if (passcodeController.text != "") {
                                      setState(() {
                                        userInfo.write(
                                            "passCode",
                                            passcodeController.text
                                                .toLowerCase()
                                                .trim());
                                      });
                                      _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          curve: Curves.easeIn);
                                    } else {
                                      Get.snackbar("Passcode Error",
                                          "Either skip or create your passcode!",
                                          titleText: Text(
                                            "Passcode Error",
                                            style: fontStyle1e,
                                          ),
                                          snackPosition: SnackPosition.TOP);
                                    }
                                  }
                                }),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            currentPage == 0
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            "Already have an account?",
                                          ),
                                          TextButton(
                                            child: Text(
                                              "Login",
                                              style: TextStyle(
                                                  color: constantValues
                                                      .successColor,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            onPressed: () {
                                              Get.to(const Login());
                                            },
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.85,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                            text:
                                                "By registering, you agree to our ",
                                            style: fontStyle2a,
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: "Terms and Conditions.",
                                                style: fontStyle2b,
                                                onEnter: (e) {},
                                              ),
                                              TextSpan(
                                                text: " Please review our  ",
                                                style: fontStyle2a,
                                              ),
                                              TextSpan(
                                                text: "Privacy Policy",
                                                style: fontStyle2b,
                                                onEnter: (e) {},
                                              ),
                                              TextSpan(
                                                text:
                                                    " for information on how we handle your data.",
                                                style: fontStyle2a,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        ),
                ],
              ),
            ),
          ],
        )));
  }
}
