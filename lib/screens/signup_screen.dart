import 'package:cruchshop/screens/home_screen.dart';
import 'package:cruchshop/screens/login_screen.dart';
import 'package:cruchshop/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../utils/widht_height.dart';
import '../widgets/my_button.dart';
import '../widgets/my_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
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

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm Password is required';
    } else if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    } else if (value.length < 10 || value.length > 15) {
      return 'Phone Number must be between 10 and 15 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                'Register',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.0005,
              ),
              Text(
                'Create new account',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyTextfield(
                controller: _emailController,
                hint: 'Email',
                validator: _validateEmail,
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyTextfield(
                controller: _phoneNumberController,
                hint: 'Phone Number',
                keyboardType: TextInputType.phone,
                validator: _validatePhoneNumber,
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyTextfield(
                controller: _passwordController,
                hint: 'Password',
                validator: _validatePassword,
                obscureText: true,
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyTextfield(
                controller: _confirmPasswordController,
                hint: 'Confirm Password',
                validator: _validateConfirmPassword,
                obscureText: true,
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.03,
              ),
              MyButton(
                width: WidthHeight(context).width * double.infinity,
                color: Colors.red,
                text: 'Signup',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  }
                },
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
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
