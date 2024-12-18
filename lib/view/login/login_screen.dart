import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:provider/provider.dart';

import '../../res/color/app_colors.dart';
import '../../reusable_components/rounded_button.dart';
import '../../utils/toast_utils.dart';
import '../../view_models/authViewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final screenHeight = MediaQuery.of(context).size.height * 1;
    final screenWidth = MediaQuery.of(context).size.width * 1;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryMainColor,
        body: WillPopScope(
          onWillPop: () async {
            exit(0);
            return true;
          },
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.24,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(child: Image.asset("images/iubat_cse-logo.png"))),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Container(
                      width: screenWidth * 0.95,
                      decoration: BoxDecoration(
                        color: AppColors.navOpacity,
                        border: Border.all(
                          color: AppColors.navButtonColor,
                          width: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      /// Input User's Email
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 12.0),
                          prefixIcon: Icon(Icons.alternate_email,
                              color: Colors.blue, size: 20),
                        ),
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Center(
                      child: ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child) {
                            return Column(
                              children: [
                                Container(
                                  width: screenWidth * 0.95,
                                  decoration: BoxDecoration(
                                    color: AppColors.navOpacity,
                                    border: Border.all(
                                      color: AppColors.navButtonColor,
                                      width: 0.1,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  /// Input User's Password
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obsecurePassword.value,
                                    focusNode: passwordFocusNode,
                                    obscuringCharacter: "*",
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                       hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                       contentPadding: EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 12.0),
                                      prefixIcon: Icon(
                                        Icons.lock_open_rounded,
                                        color: Colors.redAccent,
                                        size: 20,
                                      ),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            _obsecurePassword.value =
                                                !_obsecurePassword.value;
                                          },
                                          child: Icon(
                                            _obsecurePassword.value
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility,
                                            color: AppColors.navColor,
                                          )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                /// Forget Password section
                                Container(
                                  width: screenWidth * 0.95,
                                  // color:Colors.blueAccent,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigator.push(context, MaterialPageRoute(builder: (context) => SendOTP()));
                                    },
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        "Forget Password",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration
                                              .underline, // Underline the text
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),

                    /// Login Button
                    RoundButtonLogo(
                      title: 'Login',
                      loading: authViewMode.loading,
                      onPress: () {
                        if (_emailController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter email', context);
                        } else if (_passwordController.text.isEmpty) {
                          Utils.flushBarErrorMessage(
                              'Please enter password', context);
                        } else if (_passwordController.text.length < 6) {
                          Utils.flushBarErrorMessage(
                              'Please enter correct password', context);
                        } else {

                          Map data = {
                            'email' : _emailController.text.toString(),
                            'password' : _passwordController.text.toString(),
                          };

                          authViewMode.loginApi(data , context);
                          print('api hit');
                        }
                      },
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Text("Please enter your email and password to ",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400)),
                    Text("access your dashboard.",
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400)),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}
