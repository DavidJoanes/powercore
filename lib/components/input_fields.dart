import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:email_validator/email_validator.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/constants.dart';
import 'input_containers.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class EmailFieldA extends StatefulWidget {
  final TextEditingController controller;
  final double width;
  final String title;
  const EmailFieldA({
    super.key,
    required this.controller,
    required this.width,
    required this.title,
  });

  @override
  State<EmailFieldA> createState() => _EmailFieldAState();
}

class _EmailFieldAState extends State<EmailFieldA> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (value) => value != null && !EmailValidator.validate(value)
            ? 'Invalid email address!'
            : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: userInfo.read("isDarkTheme")
                    ? constantValues.whiteColor
                    : constantValues.blackColor)),
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.mail),
          labelText: widget.title,
          labelStyle: GoogleFonts.poppins(
              textStyle: const TextStyle(
                  // color: userInfo.read("isDarkTheme")
                  //     ? constantValues.whiteColor
                  //     : constantValues.blackColor
                  )),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputFieldA extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final String title;
  final bool enabled;
  final Widget hintIcon;
  final Iterable<String> autoFillHint;
  const InputFieldA({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.title,
    required this.enabled,
    required this.hintIcon,
    required this.autoFillHint,
  });

  @override
  State<InputFieldA> createState() => _InputFieldAState();
}

class _InputFieldAState extends State<InputFieldA> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autoFillHint,
        enabled: widget.enabled,
        validator: (value) => value!.isEmpty ? "required!" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: widget.hintIcon,
          hintText: widget.title,
          hintStyle: GoogleFonts.poppins(textStyle: const TextStyle()),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputFieldB extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final String title;
  final bool enabled;
  final Widget hintIcon;
  final Iterable<String> autoFillHint;
  const InputFieldB({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.title,
    required this.enabled,
    required this.hintIcon,
    required this.autoFillHint,
  });

  @override
  State<InputFieldB> createState() => _InputFieldBState();
}

class _InputFieldBState extends State<InputFieldB> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autoFillHint,
        enabled: widget.enabled,
        validator: (value) => value!.isEmpty ? "required!" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: widget.hintIcon,
          labelText: widget.title,
          hintStyle: GoogleFonts.poppins(textStyle: const TextStyle()),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputFieldC extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final String title;
  final bool enabled;
  final Widget hintIcon;
  final Widget suffixIcon;
  final Iterable<String> autoFillHint;
  const InputFieldC({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.title,
    required this.enabled,
    required this.hintIcon,
    required this.suffixIcon,
    required this.autoFillHint,
  });

  @override
  State<InputFieldC> createState() => _InputFieldCState();
}

class _InputFieldCState extends State<InputFieldC> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autofillHints: widget.autoFillHint,
        enabled: widget.enabled,
        validator: (value) => value!.isEmpty ? "required!" : null,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: widget.hintIcon,
          suffixIcon: widget.suffixIcon,
          labelText: widget.title,
          hintStyle: GoogleFonts.poppins(textStyle: const TextStyle()),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class NumberFieldA extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final String title;
  final int maxLength;
  final bool enabled;
  const NumberFieldA({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.title,
    required this.maxLength,
    required this.enabled,
  });

  @override
  State<NumberFieldA> createState() => _NumberFieldAState();
}

class _NumberFieldAState extends State<NumberFieldA> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        autofillHints: const [AutofillHints.telephoneNumber],
        enabled: widget.enabled,
        validator: (value) => value!.isNotEmpty
            ? !value.isNum
                ? "Invalid ${widget.title}!"
                : value.length < widget.maxLength
                    ? "Incomplete ${widget.title}!"
                    : null
            : "required!",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: const Icon(CupertinoIcons.number_circle),
          hintText: widget.title,
          hintStyle: GoogleFonts.poppins(textStyle: const TextStyle()),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class NumberFieldB extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final double width;
  final String title;
  final int maxLength;
  final Widget hintIcon;
  final bool enabled;
  const NumberFieldB({
    super.key,
    required this.controller,
    required this.keyboardType,
    required this.width,
    required this.title,
    required this.maxLength,
    required this.hintIcon,
    required this.enabled,
  });

  @override
  State<NumberFieldB> createState() => _NumberFieldBState();
}

class _NumberFieldBState extends State<NumberFieldB> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      width: widget.width,
      child: TextFormField(
        textInputAction: TextInputAction.go,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        maxLength: widget.maxLength,
        autofillHints: const [AutofillHints.telephoneNumber],
        enabled: widget.enabled,
        validator: (value) => value!.isNotEmpty
            ? !value.isNum
                ? "Invalid ${widget.title}!"
                : value.startsWith("0")
                    ? "Invalid ${widget.title}! Remove the first '0'"
                    : null
            : "required!",
        autovalidateMode: AutovalidateMode.onUserInteraction,
        cursorColor: constantValues.primaryColor,
        style: GoogleFonts.poppins(textStyle: const TextStyle()),
        decoration: InputDecoration(
          prefixIcon: widget.hintIcon,
          hintText: widget.title,
          hintStyle: GoogleFonts.poppins(textStyle: const TextStyle()),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
