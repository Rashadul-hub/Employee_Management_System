import 'package:cse_department/routes/routes.dart';
import 'package:cse_department/routes/routes_name.dart';
import 'package:cse_department/view_models/authViewmodel.dart';
import 'package:cse_department/view_models/dashboardViewModel.dart';
import 'package:cse_department/view_models/userViewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
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
