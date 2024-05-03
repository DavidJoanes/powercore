import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/screens/register/register.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../components/buttons.dart';
import '../../controllers/constants.dart';
import '../login/login01.dart';
import 'onboard_01.dart';
import 'onboard_02.dart';
import 'onboard_03.dart';

class CustomOnboarding extends StatefulWidget {
  const CustomOnboarding({super.key});

  @override
  State<CustomOnboarding> createState() => _CustomOnboardingState();
}

class _CustomOnboardingState extends State<CustomOnboarding> {
  final constantValues = Get.find<Constants>();
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: TextStyle(color: constantValues.whiteColor));
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = (index == 2);
              });
            },
            children: const [
              CustomOnboarding01(),
              CustomOnboarding02(),
              CustomOnboarding03(),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isLastPage
                      ? const SizedBox()
                      : TextButton(
                          child: Text(
                            "Skip",
                            style: fontStyle1a,
                          ),
                          onPressed: () {
                            _controller.jumpToPage(2);
                          },
                        ),
                ],
              ),
              isLastPage
                    ? SizedBox(height: size.height * 0.75) : SizedBox(height: size.height * 0.7),
              SmoothPageIndicator(controller: _controller, count: 3),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: isLastPage
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ButtonA(
                              width: size.width * 0.4,
                              borderColor: constantValues.whiteColor,
                              bgColor: constantValues.transparentColor,
                              textColor: constantValues.whiteColor,
                              text: "Create Account",
                              authenticate: () {
                                Get.off(const Register());
                              }),
                          ButtonA(
                              width: size.width * 0.3,
                              borderColor: constantValues.transparentColor,
                              bgColor: constantValues.whiteColor,
                              textColor: constantValues.blackColor,
                              text: "Log In",
                              authenticate: () {
                                Get.off(const Login());
                              }),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ButtonA(
                              width: size.width * 0.3,
                              borderColor: constantValues.transparentColor,
                              bgColor: constantValues.whiteColor,
                              textColor: constantValues.blackColor,
                              text: "Next",
                              authenticate: () {
                                _controller.nextPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeOut);
                              })
                        ],
                      ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
