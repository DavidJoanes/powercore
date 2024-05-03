// ignore_for_file: prefer_typing_uninitialized_variables, use_super_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/constants.dart';

final constantValues = Get.find<Constants>();
var userInfo = GetStorage();

class ButtonA extends StatefulWidget {
  ButtonA(
      {Key? key,
      required this.width,
      required this.borderColor,
      required this.bgColor,
      required this.textColor,
      required this.text,
      required this.authenticate})
      : super(key: key);
  final double width;
  var borderColor;
  var bgColor;
  var textColor;
  final String text;
  final Function authenticate;
  bool isDisabled = false;

  @override
  State<ButtonA> createState() => _ButtonAState();
}

class _ButtonAState extends State<ButtonA> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.bgColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
        ),
        onPressed: !widget.isDisabled
            ? () async {
                if (!widget.isDisabled) {
                  setState(() => widget.isDisabled = true);
                  await widget.authenticate();
                  setState(() => widget.isDisabled = false);
                }
              }
            : null,
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
              textStyle: TextStyle(
            color: widget.textColor,
            fontWeight: FontWeight.w700,
          )),
        ));
  }
}

class ButtonB extends StatefulWidget {
  ButtonB(
      {Key? key,
      required this.width,
      required this.preffixIcon,
      required this.suffixIcon,
      required this.borderColor,
      required this.bgColor,
      required this.textColor,
      required this.text,
      required this.authenticate})
      : super(key: key);
  final double width;
  final Widget preffixIcon;
  final Widget suffixIcon;
  var borderColor;
  var bgColor;
  var textColor;
  final String text;
  final Function authenticate;
  bool isDisabled = false;

  @override
  State<ButtonB> createState() => _ButtonBState();
}

class _ButtonBState extends State<ButtonB> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.bgColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
        ),
        onPressed: !widget.isDisabled
            ? () async {
                if (!widget.isDisabled) {
                  setState(() => widget.isDisabled = true);
                  await widget.authenticate();
                  setState(() => widget.isDisabled = false);
                }
              }
            : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.preffixIcon,
            Text(
              widget.text,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                color: widget.textColor,
                fontWeight: FontWeight.w500,
              )),
            ),
            widget.suffixIcon,
          ],
        ));
  }
}

class ButtonC extends StatefulWidget {
  ButtonC(
      {Key? key,
      required this.width,
      required this.borderColor,
      required this.bgColor,
      required this.textColor,
      required this.text,
      required this.authenticate})
      : super(key: key);
  final double width;
  var borderColor;
  var bgColor;
  var textColor;
  final String text;
  final Function authenticate;
  late bool isLoading = false;
  bool isDisabled = false;

  @override
  State<ButtonC> createState() => _ButtonCState();
}

class _ButtonCState extends State<ButtonC> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        border: Border.all(color: widget.borderColor, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.width * 0.1),
        child: newElevatedButton(context),
      ),
    );
  }

  Widget newElevatedButton(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.bgColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
        ),
        onPressed: !widget.isDisabled
            ? () async {
                if (!widget.isDisabled) {
                  setState(() => widget.isLoading = true);
                  setState(() => widget.isDisabled = true);
                  await widget.authenticate();
                  await Future.delayed(const Duration(seconds: 3));
                  setState(() => widget.isLoading = false);
                  setState(() => widget.isDisabled = false);
                }
              }
            : null,
        child: widget.isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: widget.textColor,
                  ),
                ),
              )
            : Text(
                widget.text,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: widget.textColor,
                  fontWeight: FontWeight.w500,
                )),
              ));
  }
}
