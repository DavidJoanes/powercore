import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/constants.dart';

class EmailPreferences extends StatefulWidget {
  const EmailPreferences({super.key});

  @override
  State<EmailPreferences> createState() => _EmailPreferencesState();
}

class _EmailPreferencesState extends State<EmailPreferences> {
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
    final fontStyle1 = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w500));
    final fontStyle1a = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w600));
    final fontStyle1b = GoogleFonts.poppins(
        textStyle: const TextStyle(fontWeight: FontWeight.w300));
    final fontStyle1c = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w300, fontSize: size.width * 0.025));
    final fontStyle1d = GoogleFonts.poppins(
        textStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: size.width * 0.04));
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
          "Email Preferences",
          style: fontStyle1,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                child: buildCustomWidget(
                  size: size,
                  font1: fontStyle1a,
                  font2: fontStyle1b,
                  title: "All Email Notifications",
                  subtitle:
                      "Get all Powercore emails. You can change this preference at any time.",
                  icon: IconButton(
                    onPressed: () {
                      setState(() {
                        userInfo.write(
                          "emailPreferences",
                          {
                            "allEmails":
                                !userInfo.read("emailPreferences")["allEmails"],
                            "newsLetters":
                                !userInfo.read("emailPreferences")["allEmails"],
                            "offers":
                                !userInfo.read("emailPreferences")["allEmails"],
                            "accountUpdates":
                                !userInfo.read("emailPreferences")["allEmails"],
                            "productUpdates":
                                !userInfo.read("emailPreferences")["allEmails"],
                          },
                        );
                      });
                    },
                    icon: userInfo.read("emailPreferences")["allEmails"]
                        ? Icon(
                            Icons.toggle_on_rounded,
                            color: constantValues.primaryColor,
                            size: 40,
                          )
                        : Icon(
                            Icons.toggle_off_rounded,
                            color: constantValues.greyColor,
                            size: 40,
                          ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  "CUSTOMIZE NOTIFICATIONS",
                  style: fontStyle1d,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Card(
                child: Column(
                  children: [
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1a,
                      font2: fontStyle1b,
                      title: "Newsletters",
                      subtitle:
                          "Be among the first set of people to know about new products, services and innovations.",
                      icon: IconButton(
                        onPressed: () {
                          !userInfo.read("emailPreferences")["allEmails"]
                              ? setState(() {
                                  userInfo.write(
                                    "emailPreferences",
                                    {
                                      "allEmails": userInfo.read(
                                          "emailPreferences")["allEmails"],
                                      "newsLetters": !userInfo.read(
                                          "emailPreferences")["newsLetters"],
                                      "offers": userInfo
                                          .read("emailPreferences")["offers"],
                                      "accountUpdates": userInfo.read(
                                          "emailPreferences")["accountUpdates"],
                                      "productUpdates": userInfo.read(
                                          "emailPreferences")["productUpdates"],
                                    },
                                  );
                                })
                              : null;
                        },
                        icon: userInfo.read("emailPreferences")["newsLetters"]
                            ? Icon(
                                Icons.toggle_on_rounded,
                                color: constantValues.primaryColor,
                                size: 40,
                              )
                            : Icon(
                                Icons.toggle_off_rounded,
                                color: constantValues.greyColor,
                                size: 40,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: const Divider(),
                    ),
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1a,
                      font2: fontStyle1b,
                      title: "Promotions and Offers",
                      subtitle:
                          "Get notified about exclusive discounts, campaign news, promotions and recommendations.",
                      icon: IconButton(
                        onPressed: () {
                          !userInfo.read("emailPreferences")["allEmails"]
                              ? setState(() {
                                  userInfo.write(
                                    "emailPreferences",
                                    {
                                      "allEmails": userInfo.read(
                                          "emailPreferences")["allEmails"],
                                      "newsLetters": userInfo.read(
                                          "emailPreferences")["newsLetters"],
                                      "offers": !userInfo
                                          .read("emailPreferences")["offers"],
                                      "accountUpdates": userInfo.read(
                                          "emailPreferences")["accountUpdates"],
                                      "productUpdates": userInfo.read(
                                          "emailPreferences")["productUpdates"],
                                    },
                                  );
                                })
                              : null;
                        },
                        icon: userInfo.read("emailPreferences")["offers"]
                            ? Icon(
                                Icons.toggle_on_rounded,
                                color: constantValues.primaryColor,
                                size: 40,
                              )
                            : Icon(
                                Icons.toggle_off_rounded,
                                color: constantValues.greyColor,
                                size: 40,
                              ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: const Divider(),
                    ),
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1a,
                      font2: fontStyle1b,
                      title: "Account Updates",
                      subtitle:
                          "Get notifications you may have missed, up-to-date performance insights and account activity.",
                      icon: IconButton(
                        onPressed: () {
                          !userInfo.read("emailPreferences")["allEmails"]
                              ? setState(() {
                                  userInfo.write(
                                    "emailPreferences",
                                    {
                                      "allEmails": userInfo.read(
                                          "emailPreferences")["allEmails"],
                                      "newsLetters": userInfo.read(
                                          "emailPreferences")["newsLetters"],
                                      "offers": userInfo
                                          .read("emailPreferences")["offers"],
                                      "accountUpdates": !userInfo.read(
                                          "emailPreferences")["accountUpdates"],
                                      "productUpdates": userInfo.read(
                                          "emailPreferences")["productUpdates"],
                                    },
                                  );
                                })
                              : null;
                        },
                        icon:
                            userInfo.read("emailPreferences")["accountUpdates"]
                                ? Icon(
                                    Icons.toggle_on_rounded,
                                    color: constantValues.primaryColor,
                                    size: 40,
                                  )
                                : Icon(
                                    Icons.toggle_off_rounded,
                                    color: constantValues.greyColor,
                                    size: 40,
                                  ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.04),
                      child: const Divider(),
                    ),
                    buildCustomWidget(
                      size: size,
                      font1: fontStyle1a,
                      font2: fontStyle1b,
                      title: "Product Updates",
                      subtitle:
                          "Stay updated on our latest advancements, innovations in the technology sector.",
                      icon: IconButton(
                        onPressed: () {
                          !userInfo.read("emailPreferences")["allEmails"]
                              ? setState(() {
                                  userInfo.write(
                                    "emailPreferences",
                                    {
                                      "allEmails": userInfo.read(
                                          "emailPreferences")["allEmails"],
                                      "newsLetters": userInfo.read(
                                          "emailPreferences")["newsLetters"],
                                      "offers": userInfo
                                          .read("emailPreferences")["offers"],
                                      "accountUpdates": userInfo.read(
                                          "emailPreferences")["accountUpdates"],
                                      "productUpdates": !userInfo.read(
                                          "emailPreferences")["productUpdates"],
                                    },
                                  );
                                })
                              : null;
                        },
                        icon:
                            userInfo.read("emailPreferences")["productUpdates"]
                                ? Icon(
                                    Icons.toggle_on_rounded,
                                    color: constantValues.primaryColor,
                                    size: 40,
                                  )
                                : Icon(
                                    Icons.toggle_off_rounded,
                                    color: constantValues.greyColor,
                                    size: 40,
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SizedBox(
                width: size.width,
                child: Text(
                  "You may still recieve emails from Acecore Incorporations related to account security and administrative correspondence",
                  textAlign: TextAlign.center,
                  style: fontStyle1c,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildCustomWidget({
    required var size,
    required TextStyle font1,
    required TextStyle font2,
    required String title,
    required String subtitle,
    required Widget icon,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.012),
      child: SizedBox(
        width: size.width,
        child: ListTile(
          title: Text(
            title,
            style: font1,
          ),
          subtitle: Text(
            subtitle,
            style: font2,
          ),
          trailing: icon,
        ),
      ),
    );
  }
}
