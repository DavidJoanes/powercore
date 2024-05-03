import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/input_fields.dart';
import '../../controllers/constants.dart';

class EnterFullName extends StatefulWidget {
  const EnterFullName(
      {super.key,
      required this.formKey,
      required this.firstnameController,
      required this.lastnameController, required this.fontStyle1c, required this.fontStyle1d});
  final Key formKey;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextStyle fontStyle1c;
  final TextStyle fontStyle1d;

  @override
  State<EnterFullName> createState() => _EnterFullNameState();
}

class _EnterFullNameState extends State<EnterFullName> {
  final constantValues = Get.find<Constants>();
  var userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // widget.firstnameController.dispose();
    // widget.lastnameController.dispose();
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
                    "Full Name",
                    style: widget.fontStyle1c,
                  ),
                  subtitle: Text(
                    "Let us know how to address you properly.",
                    style: widget.fontStyle1d,
                  ),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            InputFieldB(
                controller: widget.firstnameController,
                keyboardType: TextInputType.text,
                width: size.width * 0.85,
                title: "First name",
                enabled: true,
                hintIcon: const Icon(CupertinoIcons.person),
                autoFillHint: const [AutofillHints.name]),
            SizedBox(
              height: size.height * 0.02,
            ),
            InputFieldB(
                controller: widget.lastnameController,
                keyboardType: TextInputType.text,
                width: size.width * 0.85,
                title: "Last name",
                enabled: true,
                hintIcon: const Icon(CupertinoIcons.person),
                autoFillHint: const [AutofillHints.name]),
            SizedBox(
              height: size.height * 0.5,
            ),
          ])),
    );
  }
}
