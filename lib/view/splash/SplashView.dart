import 'package:cse_department/data/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 1;
    final screenWidth = MediaQuery.of(context).size.width * 1;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: screenHeight * 0.9,
                      width: screenWidth * 0.5,
                      // color: Colors.red,
                      child: Image.asset(
                        "images/iubat_cse-logo.png",
                      ),
                      // child:  Image.asset("images/splashimg.png",),
                    ),
                    Text(
                      "Attendly",
                      style: (TextStyle(
                          color: Colors.white12,
                          fontSize: 25,
                          fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
