// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/components/input_fields.dart';

import '../../components/buttons.dart';
import '../../controllers/constants.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();
  final _formKey = GlobalKey<FormState>();
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final List<_PositionItem> _positionItems = <_PositionItem>[];
  bool positionStreamStarted = false;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    firstnameController.text = userInfo.read("firstName");
    lastnameController.text = userInfo.read("lastName");
    emailController.text = userInfo.read("emailAddress");
    phoneController.text = userInfo.read("phoneNumber") ?? constantValues.phone;
    addressController.text = userInfo.read("address") ?? constantValues.address;
  }

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, color: constantValues.errorColor));
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
            "Edit Profile",
            style: fontStyle1a,
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  InputFieldB(
                    controller: firstnameController,
                    keyboardType: TextInputType.name,
                    width: size.width * 0.9,
                    title: "First name",
                    enabled: true,
                    hintIcon: const Icon(CupertinoIcons.person),
                    autoFillHint: const [AutofillHints.givenName],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  InputFieldB(
                    controller: lastnameController,
                    keyboardType: TextInputType.name,
                    width: size.width * 0.9,
                    title: "Last name",
                    enabled: true,
                    hintIcon: const Icon(CupertinoIcons.person),
                    autoFillHint: const [AutofillHints.familyName],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  InputFieldB(
                    controller: emailController,
                    keyboardType: TextInputType.name,
                    width: size.width * 0.9,
                    title: "Email address",
                    enabled: false,
                    hintIcon: const Icon(CupertinoIcons.mail),
                    autoFillHint: const [AutofillHints.email],
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  NumberFieldB(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    width: size.width * 0.9,
                    title: "Phone number",
                    maxLength: 10,
                    hintIcon: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: size.height * 0.02),
                      child: Text(constantValues.phone),
                    ),
                    enabled: true,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  InputFieldC(
                    controller: addressController,
                    keyboardType: TextInputType.streetAddress,
                    width: size.width * 0.9,
                    title: "Address",
                    enabled: true,
                    hintIcon: const Icon(CupertinoIcons.location),
                    suffixIcon: IconButton(
                        tooltip: "Fetch my location",
                        icon: Icon(
                          Icons.my_location_rounded,
                          color: constantValues.primaryColor,
                        ),
                        onPressed: () async {
                          _getCurrentPosition(fontStyle1b);
                        }),
                    autoFillHint: const [AutofillHints.addressCityAndState],
                  ),
                  SizedBox(
                    height: size.height * 0.25,
                  ),
                  ButtonA(
                    width: size.width * 0.9,
                    borderColor: constantValues.transparentColor,
                    bgColor: constantValues.primaryColor,
                    textColor: constantValues.whiteColor,
                    text: "Save",
                    authenticate: () {
                      save(
                          _formKey,
                          firstnameController.text,
                          lastnameController.text,
                          userInfo.read("emailAddress"),
                          phoneController.text,
                          addressController.text);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  save(key, String fName, String lName, String email, String phoneNumber,
      String homeAddress) {
    final form = key.currentState!;
    final first = fName.toLowerCase().trim();
    final last = lName.toLowerCase().trim();
    final mail = email.toLowerCase().trim();
    final phone = phoneNumber.trim();
    final add = homeAddress.toLowerCase().trim();
    if (form.validate()) {
      setState(() {
        userInfo.write("firstName", first);
        userInfo.write("lastName", last);
        userInfo.write("emailAddress", mail);
        userInfo.write("phoneNumber", "${constantValues.phone}$phone");
        userInfo.write("address", add);
      });
    }
  }

  Future<void> _getCurrentPosition(font) async {
    final hasPermission = await _handlePermission();
    GeoCode geoCode =
        GeoCode(apiKey: "AIzaSyAcqyZ3Q4JVV4FJ4bOHUKbieMONaH0LG80");

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    try {
      final add = await geoCode.reverseGeocoding(
          latitude: position.latitude, longitude: position.longitude);
      // final completeAdd =
      //     "${add.streetNumber} ${add.streetAddress}, ${add.city}, ${add.countryName}";
      final completeAdd = "${position.latitude}, ${position.longitude}";
      print(add);
      print(completeAdd);
      // add.city != null ?
      setState(() {
        userInfo.write("address", completeAdd);
        addressController.text = userInfo.read("address");
      });
      // : null;
    } catch (e) {
      print(e);
      Get.snackbar(
        "Location Error",
        "Couldn't fetch your location! Please, try again.",
        titleText: Text(
          "Passcode Error",
          style: font,
        ),
      );
    }
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _updatePositionList(
        _PositionItemType.log,
        _kLocationServicesDisabledMessage,
      );

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _updatePositionList(
          _PositionItemType.log,
          _kPermissionDeniedMessage,
        );

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _updatePositionList(
        _PositionItemType.log,
        _kPermissionDeniedForeverMessage,
      );

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _updatePositionList(
      _PositionItemType.log,
      _kPermissionGrantedMessage,
    );
    return true;
  }

  void _updatePositionList(_PositionItemType type, String displayValue) {
    _positionItems.add(_PositionItem(type, displayValue));
    setState(() {});
  }
}

enum _PositionItemType {
  log,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final _PositionItemType type;
  final String displayValue;
}
