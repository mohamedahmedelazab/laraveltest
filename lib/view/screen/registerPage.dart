import 'package:aktest/core/constant/colors.dart';
import 'package:aktest/view/widget/auth/ElevatedAuthButton.dart';
import 'package:aktest/view/widget/auth/myTextFormField.dart';
import 'package:aktest/view/widget/auth/topAuthPage.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

   TextEditingController email=TextEditingController();
   TextEditingController password=TextEditingController();
   TextEditingController username=TextEditingController();
   TextEditingController phone=TextEditingController();


    RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TopAuthPage(
                    titleText: "Register",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  MyTextFormField(
                    mycontroller: username,
                      hintText: "Enter your Username",
                      labelText: "username",
                      iconSuffix: Icons.person_2_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    mycontroller: email,
                      hintText: "Enter your Email",
                      labelText: "Email",
                      iconSuffix: Icons.email_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    mycontroller: phone,
                      hintText: "Enter your Phone",
                      labelText: "Phone",
                      iconSuffix: Icons.phone_android_outlined),
                  const SizedBox(
                    height: 10,
                  ),
                  MyTextFormField(
                    mycontroller: password,
                      hintText: "Enter your Password",
                      labelText: "Password",
                      iconSuffix: Icons.lock_outline),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedLoginButton(
                    btncolor: MaterialStatePropertyAll(primryColor),
                    textButton: "Sign Up",
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
