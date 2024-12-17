import 'package:cse_department/routes/routes.dart';
import 'package:cse_department/routes/routes_name.dart';
import 'package:cse_department/view_models/authViewmodel.dart';
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
      ],
      child: Builder(builder: (BuildContext context) {
        /// Check login status when the app starts
        // final authViewModel = Provider.of<AuthViewModel>(context);
        // authViewModel.checkLoginStatus(context);
        // Delay the navigation until the widget is fully initialized


        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.splash,
          onGenerateRoute: Routes.generateRoute,
        );
      }),
    );
  }
}
