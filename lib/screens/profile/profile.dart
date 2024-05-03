import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:powercore/components/buttons.dart';
import 'package:powercore/screens/profile/edit_profile.dart';

import '../../controllers/constants.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: TextStyle(color: constantValues.primaryColor));
    final fontStyle1c1 = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w600, color: constantValues.errorColor));
    final fontStyle1c2 = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w500, color: constantValues.greyColor));
    final fontStyle1d = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w300, fontSize: 20));
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
        actions: [
          TextButton(
              onPressed: () {
                Get.to(const EditProfile());
              },
              child: Text(
                "Edit Profile",
                style: fontStyle1b,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              buildHeader(
                size: size,
                initials: userInfo.read("firstName")[0],
                firstName: userInfo.read("firstName"),
                lastName: userInfo.read("lastName"),
                pcID: userInfo.read("powercellID"),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                thickness: 5,
              ),
              buildInfo(
                size: size,
                font: fontStyle1a,
                icon: CupertinoIcons.person,
                title: "Full name",
                data:
                    "${constantValues.fName.capitalizeFirst} ${constantValues.lName.capitalizeFirst}",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: const Divider(),
              ),
              buildInfo(
                size: size,
                font: fontStyle1a,
                icon: CupertinoIcons.mail,
                title: "Email address",
                data: userInfo.read("emailAddress"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: const Divider(),
              ),
              buildInfo(
                size: size,
                font: fontStyle1a,
                icon: CupertinoIcons.device_phone_portrait,
                title: "Phone",
                data: userInfo.read("phoneNumber"),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                thickness: 5,
              ),
              buildInfo(
                size: size,
                font: fontStyle1a,
                icon: CupertinoIcons.location,
                title: "Address",
                data: userInfo.read("address"),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Divider(
                thickness: 5,
              ),
              buildBottomButtons(
                  size: size,
                  icon: Icon(
                    Icons.logout_rounded,
                    color: constantValues.errorColor,
                  ),
                  font: fontStyle1c1,
                  title: "Log out",
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Are you sure you wish to log out?",
                              style: fontStyle1d,
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonA(
                                    width: 100,
                                    borderColor:
                                        constantValues.transparentColor,
                                    bgColor: constantValues.transparentColor,
                                    textColor: constantValues.whiteColor,
                                    text: "Back",
                                    authenticate: () {
                                      Get.back();
                                    }),
                                ButtonC(
                                    width: 100,
                                    borderColor:
                                        constantValues.transparentColor,
                                    bgColor: constantValues.errorColor,
                                    textColor: constantValues.whiteColor,
                                    text: "Yes",
                                    authenticate: () {}),
                              ],
                            ),
                          );
                        });
                  }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
                child: const Divider(),
              ),
              buildBottomButtons(
                  size: size,
                  icon: const Icon(
                    CupertinoIcons.delete,
                  ),
                  font: fontStyle1c2,
                  title: "Deactivate account",
                  onTap: () {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Are you sure you wish to deactivate your account?",
                              style: fontStyle1d,
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ButtonA(
                                    width: 100,
                                    borderColor:
                                        constantValues.transparentColor,
                                    bgColor: constantValues.transparentColor,
                                    textColor: constantValues.whiteColor,
                                    text: "Back",
                                    authenticate: () {
                                      Get.back();
                                    }),
                                ButtonC(
                                    width: 100,
                                    borderColor:
                                        constantValues.transparentColor,
                                    bgColor: constantValues.greyColor,
                                    textColor: constantValues.whiteColor,
                                    text: "Yes",
                                    authenticate: () {}),
                              ],
                            ),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(
      {required var size,
      required String initials,
      required String firstName,
      required String lastName,
      required String pcID}) {
    return SizedBox(
      width: size.width * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: size.width * 0.08,
            backgroundColor: constantValues.primaryColor,
            child: Text(
              initials.toUpperCase(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: constantValues.whiteColor),
            ),
          ),
          Text(
            "${firstName.capitalizeFirst} ${lastName.capitalizeFirst}",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: size.width * 0.06, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            pcID,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                  fontSize: size.width * 0.04, fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfo({
    required var size,
    required TextStyle font,
    required IconData icon,
    required String title,
    String? data,
  }) {
    return SizedBox(
      width: size.width * 1,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title, style: font),
        subtitle: Text(
          data ?? "",
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  Widget buildBottomButtons(
      {required var size,
      required Icon icon,
      required TextStyle font,
      required String title,
      required Function onTap}) {
    return SizedBox(
      width: size.width * 1,
      child: ListTile(
        leading: icon,
        title: Text(title, style: font),
        onTap: () => onTap(),
      ),
    );
  }
}
