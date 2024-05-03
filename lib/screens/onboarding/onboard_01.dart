import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/constants.dart';

class CustomOnboarding01 extends StatefulWidget {
  const CustomOnboarding01({super.key});

  @override
  State<CustomOnboarding01> createState() => _CustomOnboarding01State();
}

class _CustomOnboarding01State extends State<CustomOnboarding01> {
  final constantValues = Get.find<Constants>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = TextStyle(
        color: constantValues.onboardColor01,
        fontWeight: FontWeight.bold,
        fontFamily: 'Switzer',
        fontSize: size.width * 0.1);
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/onboarding_1.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.6),
            SizedBox(
                width: size.width * 0.7,
                child: Text(
                  "REAL-TIME MONITORING",
                  style: fontStyle1a,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
