import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/input_fields.dart';
import '../../controllers/constants.dart';

class EnterEmailAddress extends StatefulWidget {
  const EnterEmailAddress(
      {super.key,
      required this.formKey,
      required this.emailController,
      required this.fontStyle1c,
      required this.fontStyle1d});
  final Key formKey;
  final TextEditingController emailController;
  final TextStyle fontStyle1c;
  final TextStyle fontStyle1d;

  @override
  State<EnterEmailAddress> createState() => _EnterEmailAddressState();
}

class _EnterEmailAddressState extends State<EnterEmailAddress> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // widget.emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Form(
          key: widget.formKey,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
                width: size.width * 0.9,
                child: ListTile(
                  title: Text(
                    "Email Address",
                    style: widget.fontStyle1c,
                  ),
                  subtitle: Text(
                    "Add your email in order to aid your account recovery and login.",
                    style: widget.fontStyle1d,
                  ),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            EmailFieldA(
              controller: widget.emailController,
              width: size.width * 0.85,
              title: "Email address",
            ),
            SizedBox(
              height: size.height * 0.6,
            ),
          ])),
    );
  }
}
