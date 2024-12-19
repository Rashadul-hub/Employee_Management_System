import 'dart:io';

import 'package:cse_department/res/color/app_colors.dart';
import 'package:cse_department/routes/routes.dart';
import 'package:cse_department/routes/routes_name.dart';
import 'package:cse_department/view_models/authViewmodel.dart';
import 'package:cse_department/view_models/dashboardViewModel.dart';
import 'package:cse_department/view_models/userListViewModel.dart';
import 'package:cse_department/view_models/userViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';



class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.navColor,
    statusBarColor: AppColors.navColor,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation .portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => UserListProvider()),
      ],
      child: Builder(builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}
