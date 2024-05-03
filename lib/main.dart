import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:powercore/screens/reset_passcode/reset_01.dart';
import 'package:powercore/splash.dart';
import 'package:provider/provider.dart';

import 'controllers/constants.dart';
import 'controllers/theme_controller.dart';
import 'models/state_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await GetStorage.init();
  runApp(const MyApp());
}

// final constantValues = Get.put<Constants>(Constants());
var userInfo = GetStorage();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final constantValues = Get.put(Constants());
    userInfo.writeIfNull("isDarkTheme", false);
    userInfo.writeIfNull("isNewUser", true);
    userInfo.writeIfNull("powercellID", "");
    userInfo.writeIfNull("firstName", "");
    userInfo.writeIfNull("lastName", "");
    userInfo.writeIfNull("emailAddress", "");
    userInfo.writeIfNull("countryCode", "");
    userInfo.writeIfNull("phoneNumber", "");
    userInfo.writeIfNull("address", "");
    userInfo.writeIfNull("otp", "");
    userInfo.writeIfNull("passCode", "");
    userInfo.writeIfNull("currentIndex", 0);
    userInfo.writeIfNull("pcState", false);
    return ChangeNotifierProvider<ThemeChanger>(
        create: (_) => ThemeChanger(ThemeData(
            primarySwatch:
                MaterialColor(0xFF4CAF50, constantValues.defaultColor),
            brightness: userInfo.read("isDarkTheme")
                ? Brightness.dark
                : Brightness.light)),
        child: const MyMaterialApp());
  }
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({
    super.key,
  });

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  @override
  void initState() {
    super.initState();
    initDeepLinks();
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();
    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      print('getInitialAppLink: $appLink');
      openAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      print('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    _navigatorKey.currentState?.pushNamed(uri.fragment);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return ChangeNotifierProvider(
        create: (context) => CustomStateModel(),
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Powercore',
          color: constantValues.primaryColor,
          theme: theme.getTheme(),
          home: const CustomSplashScreen(),
          navigatorKey: _navigatorKey,
          initialRoute: "/",
          onGenerateRoute: (RouteSettings settings) {
            Widget routeWidget = const CustomSplashScreen();

            // Mimic web routing
            final routeName = settings.name;
            if (routeName != null) {
              if (routeName.startsWith('/book/')) {
                // Navigated to /book/:id
                routeWidget = ResetPasscode(
                  id: routeName.substring(routeName.indexOf('/book/')),
                );
              } else if (routeName == '/book') {
                // Navigated to /book without other parameters
                routeWidget = const ResetPasscode(id: "None");
              }
            }

            return MaterialPageRoute(
              builder: (context) => routeWidget,
              settings: settings,
              fullscreenDialog: true,
            );
          },
        ));
  }
}
