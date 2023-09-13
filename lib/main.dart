import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/constants/strings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopify_flutter/shopify_config.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'core/injection/injection.dart';
import 'core/routes/app_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  ShopifyConfig.setConfig(
    storefrontAccessToken: apiKey,
    storeUrl: baseUrl,
    adminAccessToken: apiKey, // optional
    storefrontApiVersion: apiVersion, // optional
  );
  WidgetsFlutterBinding.ensureInitialized();
  EasyLoading.instance.backgroundColor = Colors.orangeAccent;
  EasyLoading.instance.userInteractions = false;
  EasyLoading.instance.dismissOnTap = false;
  await configureInjection();
  GetIt.I<AppConfig>().initialize(
    appName: appName,
    baseUrl: baseUrl,
  );
  HttpOverrides.global = MyHttpOverrides();
  (await SharedPreferences.getInstance()).clear();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterEasyLoading(
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
