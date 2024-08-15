import 'package:cruchshop/screens/forget_password_screen.dart';
import 'package:cruchshop/screens/home_screen.dart';
import 'package:cruchshop/screens/signup_screen.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/my_images.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/widgets/my_button.dart';
import 'package:cruchshop/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@gmail.com')) {
      return 'Email must contain @gmail.com';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Adjusts the body to avoid overflow
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.0005,
              ),
              Text(
                'Login to your account',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),

              MyTextfield(controller: _emailController, hint: 'Email',validator: _validateEmail,),

              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),

              MyTextfield(controller: _passwordController, hint: 'Password',validator: _validatePassword,obscureText: true,),


              SizedBox(
                height: WidthHeight(context).height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyButton(
                width: WidthHeight(context).width * double.infinity,
                color: Colors.red,
                text: 'Login',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  }
                },
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.04,
              ),
              Text(
                'or',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButton(
                    assetIconPath: MyImages().googleIcon,
                    borderColor: Colors.grey,
                    width: WidthHeight(context).width * 0.4,
                    color: Colors.transparent,
                    text: 'Google',
                    onPressed: () {
                      // Handle Google login
                    },
                  ),
                  MyButton(
                    assetIconPath: MyImages().facebookIcon,
                    borderColor: Colors.grey,
                    width: WidthHeight(context).width * 0.4,
                    color: Colors.transparent,
                    text: 'Facebook',
                    onPressed: () {
                      // Handle Facebook login
                    },
                  ),
                ],
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
