import 'package:aktest/core/constant/colors.dart';
import 'package:aktest/view/screen/homePage.dart';
import 'package:aktest/view/screen/registerPage.dart';
import 'package:aktest/view/widget/auth/ElevatedAuthButton.dart';
import 'package:aktest/view/widget/auth/forgetPasswordWidget.dart';
import 'package:aktest/view/widget/auth/myTextFormField.dart';
import 'package:aktest/view/widget/auth/topAuthPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  static const snackbar = SnackBar(content: Text("البريد الإلكتروني صحيح لكن كلمة المرور خاطئة"));
  LoginPage({Key? key}) : super(key: key);

  Future signWithEmailAndPassword(String email, String password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password).then((userCredential) => (){


        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage()));


      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print("0");
        try {
          await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
        } on FirebaseAuthException catch (e) {
          print(e.code);
          if (e.code == 'invalid-credential') {

            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          else
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage()));
            }
        }
      } else {
        print("2");
        if (kDebugMode) {
          print(e);
        }
      }
    }
  }

  Future signWithGoogle() async {
  final GoogleSignInAccount? guser=await GoogleSignIn().signIn();
  final GoogleSignInAuthentication gAuth=await guser!.authentication;
  final creadetional=GoogleAuthProvider.credential(
    accessToken: gAuth.accessToken,
    idToken: gAuth.idToken
  );
  return FirebaseAuth.instance.signInWithCredential(creadetional);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  TopAuthPage(
                    titleText: "أهــلأَ بعــودتك",
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Form(
                            child: Column(
                          children: [
                            MyTextFormField(
                              mycontroller: emailController,
                              iconSuffix: Icons.email_outlined,
                              hintText: "البريد الإلكترونى",
                              labelText: "البريد الإلكترونى",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextFormField(
                                mycontroller: passwordController,
                                iconSuffix: Icons.remove_red_eye_outlined,
                                hintText: "كلمة المرور",
                                labelText: "كلمة المرور"),
                            const ForgetPasswordWidget(),
                            ElevatedLoginButton(
                              btncolor: const MaterialStatePropertyAll(primryColor),
                              textButton: "إنشاء الحساب",
                              onPressed: () {
                                signWithEmailAndPassword(emailController.text,
                                    passwordController.text, context);
                              },
                            ),SizedBox(height: 20,),
                            ElevatedLoginButton(
                              btncolor: MaterialStatePropertyAll(Colors.red),
                              textButton: "إنشاء حساب جوجل",
                              onPressed: () {
                                signWithGoogle().then((value) => (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomePage()));
                                });

                              },
                            )
                          ],
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: -20,
                left: -70,
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(150),
                      color: primryColor),
                )),
            Positioned(
                bottom: 15,
                left: 10,
                child: Row(
                  children: [
                    const Text(
                      " I don't have an account yet !  ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    InkWell(
                      onTap: () {
                        /*        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => RegisterPage()));*/
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
