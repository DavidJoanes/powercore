import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/constants.dart';

class CustomOnboarding02 extends StatefulWidget {
  const CustomOnboarding02({super.key});

  @override
  State<CustomOnboarding02> createState() => _CustomOnboarding02State();
}

class _CustomOnboarding02State extends State<CustomOnboarding02> {
  final constantValues = Get.find<Constants>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = TextStyle(
        color: constantValues.onboardColor02,
        fontWeight: FontWeight.bold,
        fontFamily: 'Switzer',
        fontSize: size.width * 0.1);
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/onboarding_2.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.6),
            SizedBox(
                width: size.width * 0.9,
                child: Text(
                  "TRACKING POWER USAGE",
                  style: fontStyle1a,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
