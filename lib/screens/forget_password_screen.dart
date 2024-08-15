import 'package:cruchshop/utils/app_colors.dart';
import 'package:cruchshop/utils/widht_height.dart';
import 'package:cruchshop/widgets/my_button.dart';
import 'package:cruchshop/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!value.contains('@gmail.com')) {
      return 'Email must contain @gmail.com';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.scaffoldColor,
        iconTheme: IconThemeData(
          color: Colors.white
        ),
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
              Text(
                'Forget Password',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.003,
              ),
              Text(
                'Forget your password',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: WidthHeight(context).height * 0.1,
              ),
              Container(
                width: WidthHeight(context).width*0.7,
                child: Text(
                    'Please enter email address below you will receive a link to create a new password via email',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),

                    SizedBox(height: WidthHeight(context).height*0.05,),

                    MyTextfield(controller: _emailController, hint: 'Email',validator: _validateEmail,),

                        SizedBox(
                          height: WidthHeight(context).height*0.08,
                        ),
                        MyButton(width: double.infinity, color: Colors.red, text: 'Reset Password', onPressed: (){
                          if (_formKey.currentState?.validate() ?? false) {
                            // Perform login
                          }
                        })


                      ],
                    ),
            ),
          )),
    );
  }
}
