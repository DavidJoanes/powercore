import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/screens/reset_passcode/reset_02.dart';

import '../../controllers/constants.dart';

class ResetPasscode extends StatefulWidget {
  const ResetPasscode({super.key, required this.id});
  final String id;

  @override
  State<ResetPasscode> createState() => _ResetPasscodeState();
}

class _ResetPasscodeState extends State<ResetPasscode> {
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
                    "Set new passcode",
                    style: fontStyle1a,
                  ),
                  subtitle: Text(
                    "Set a new secure passcode for your account.",
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
              onSubmit: (String newPasscode) {
                setState(() {
                  constantValues.tempResetPasscode = newPasscode;
                });
                Get.off(const ResetConfirmPasscode());
              },
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
          ]),
        ),
      ),
    );
  }
}
