import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/constants.dart';

class CustomOnboarding03 extends StatefulWidget {
  const CustomOnboarding03({super.key});

  @override
  State<CustomOnboarding03> createState() => _CustomOnboarding03State();
}

class _CustomOnboarding03State extends State<CustomOnboarding03> {
  final constantValues = Get.find<Constants>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = TextStyle(
        color: constantValues.onboardColor03,
        fontWeight: FontWeight.bold,
        fontFamily: 'Switzer',
        fontSize: size.width * 0.1);
    return SizedBox(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/onboarding_3.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.6),
            SizedBox(
                width: size.width * 0.9,
                child: Text(
                  "DIRECT CONTROL FUNCTIONALITY",
                  style: fontStyle1a,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
