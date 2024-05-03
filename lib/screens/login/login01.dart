import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/components/buttons.dart';
import 'package:powercore/components/input_fields.dart';
import 'package:powercore/screens/register/register.dart';

import '../../controllers/constants.dart';
import 'login02.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();
  final _formKey = GlobalKey<FormState>();
  TextEditingController powercellIDController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    powercellIDController.dispose();
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
            style: fontStyle1a,
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Text(
                    "Enter your Powercell ID",
                    style: fontStyle1b,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InputFieldA(
                      controller: powercellIDController,
                      keyboardType: TextInputType.number,
                      width: size.width * 0.9,
                      title: "Powercell ID",
                      enabled: true,
                      hintIcon: const Icon(CupertinoIcons.number_circle),
                      autoFillHint: const [AutofillHints.telephoneNumber]),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  ButtonA(
                      width: size.width * 0.9,
                      borderColor: constantValues.transparentColor,
                      bgColor: constantValues.primaryColor,
                      textColor: constantValues.whiteColor,
                      text: "Continue",
                      authenticate: () {
                        final form = _formKey.currentState!;
                        if (form.validate()) {
                          final pcID = powercellIDController.text.trim();
                          pcID == userInfo.read("powercellID")
                              ? Get.off(const EnterOtpForLogin())
                              : Get.snackbar(
                                  "Invalid Powercell ID",
                                  "Please, provide the correct ID of your Powercell!",
                                  titleText: Text(
                                    "Invalid Powercell ID",
                                    style: fontStyle1c,
                                  ),
                                );
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                      ),
                      TextButton(
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: constantValues.successColor,
                              fontWeight: FontWeight.w900),
                        ),
                        onPressed: () {
                          Get.to(const Register());
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.38,
                        child: DottedLine(
                          dashLength: 10,
                          dashRadius: 20,
                          lineThickness: 1,
                          dashColor: constantValues.greyColor,
                        ),
                      ),
                      Text(
                        "OR",
                        style: fontStyle1a,
                      ),
                      SizedBox(
                        width: size.width * 0.38,
                        child: DottedLine(
                          dashLength: 10,
                          dashRadius: 20,
                          lineThickness: 1,
                          dashColor: constantValues.greyColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  ButtonB(
                    width: size.width * 0.9,
                    preffixIcon: Icon(
                      CupertinoIcons.wifi,
                      color: constantValues.primaryColor,
                    ),
                    suffixIcon: const SizedBox(),
                    borderColor: constantValues.transparentColor,
                    bgColor: userInfo.read("isDarkTheme")
                        ? constantValues.blackColor2
                        : constantValues.whiteColor,
                    textColor: userInfo.read("isDarkTheme")
                        ? constantValues.whiteColor
                        : constantValues.blackColor,
                    text: "Continue with Powercell Wi-Fi",
                    authenticate: () {},
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
