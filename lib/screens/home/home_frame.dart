// import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

import '../../components/custom_drawer.dart';
import '../../controllers/constants.dart';
import '../../controllers/theme_controller.dart';
import 'dashboard.dart';
import 'home.dart';
import 'insights.dart';

class HomeFrame extends StatefulWidget {
  const HomeFrame({super.key});

  @override
  State<HomeFrame> createState() => _HomeFrameState();
}

class _HomeFrameState extends State<HomeFrame> with TickerProviderStateMixin {
  final constantValues = Get.find<Constants>();
  final userInfo = GetStorage();
  bool isPoped = false;
  int numOfBackPressed = 0;

  final tabs = const [
    Center(
      child: Home(),
    ),
    Center(
      child: Dashboard(),
    ),
    Center(
      child: Insights(),
    ),
  ];

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
    ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    return PopScope(
      canPop: isPoped,
      onPopInvoked: (val) {
        setState(() {
          numOfBackPressed++;
          _onPopInvoked(numOfBackPressed);
        });
      },
      child: Scaffold(
        drawer: CustomNavDrawer(
          theme: themeChanger,
        ),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(IconlyBold.notification))
          ],
        ),
        body: Center(
          child: tabs[userInfo.read("currentIndex")],
        ),
        bottomNavigationBar: CustomNavigationBar(
          currentIndex: userInfo.read("currentIndex"),
          onTap: (index) {
            setState(() {
              userInfo.write("currentIndex", index);
            });
          },
          backgroundColor: userInfo.read("isDarkTheme")
              ? constantValues.blackColor2
              : constantValues.whiteColor,
          selectedColor: constantValues.primaryColor,
          // indicatorColor: constantValues.primaryColor,
          // selectedItemColor: constantValues.primaryColor,
          // enableFloatingNavBar: true,
          items: [
            CustomNavigationBarItem(
              selectedIcon: const Icon(IconlyBold.home),
              icon: const Icon(
                IconlyLight.home,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                    color: userInfo.read("currentIndex") == 0
                        ? constantValues.primaryColor
                        : constantValues.greyColor,
                    fontWeight: userInfo.read("currentIndex") == 0
                        ? FontWeight.w700
                        : FontWeight.w400),
              ),
            ),
            CustomNavigationBarItem(
              selectedIcon: const Icon(Icons.dashboard),
              icon: const Icon(
                Icons.dashboard_outlined,
              ),
              title: Text(
                "Dashboard",
                style: TextStyle(
                    color: userInfo.read("currentIndex") == 1
                        ? constantValues.primaryColor
                        : constantValues.greyColor,
                    fontWeight: userInfo.read("currentIndex") == 1
                        ? FontWeight.w700
                        : FontWeight.w400),
              ),
            ),
            CustomNavigationBarItem(
              selectedIcon: const Icon(CupertinoIcons.chart_bar_square_fill),
              icon: const Icon(
                CupertinoIcons.chart_bar_square,
              ),
              title: Text(
                "Insights",
                style: TextStyle(
                    color: userInfo.read("currentIndex") == 2
                        ? constantValues.primaryColor
                        : constantValues.greyColor,
                    fontWeight: userInfo.read("currentIndex") == 2
                        ? FontWeight.w700
                        : FontWeight.w400),
              ),
            ),
            // CrystalNavigationBarItem(
            //   icon: IconlyBold.home,
            //   unselectedIcon: IconlyLight.home,
            // ),
            // CrystalNavigationBarItem(
            //   icon: Icons.dashboard,
            //   unselectedIcon: Icons.dashboard_outlined,
            // ),
            // CrystalNavigationBarItem(
            //   icon: Icons.analytics,
            //   unselectedIcon: Icons.analytics_outlined,
            // ),
          ],
        ),
      ),
    );
  }

  Future<bool> _onPopInvoked(value) async {
    if (isPoped) {
      return false;
    } else {
      // First back press
      value <= 2
          ? ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Touch again to exit"),
                duration: Duration(seconds: 1),
              ),
            )
          : null;
      // Reset the flag after 2 seconds
      value > 1
          ? setState(() {
              isPoped = true;
            })
          : null;
    }
    return false;
  }
}
