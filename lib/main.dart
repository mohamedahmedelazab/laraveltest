import 'package:aktest/view/screen/homePage.dart';
import 'package:aktest/view/screen/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future<void> FireMessagingNackgroundHandler(RemoteMessage message)
async {
  print(message.messageId);
}
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

  );
FirebaseMessaging.onBackgroundMessage(FireMessagingNackgroundHandler);

  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale("ar"),
      debugShowCheckedModeBanner: false,
      title: 'Firbase Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:   CheckUserLogin(),
    );
  }
}

class CheckUserLogin extends StatefulWidget {
  const CheckUserLogin({Key? key}) : super(key: key);

  @override
  State<CheckUserLogin> createState() => _CheckUserLoginState();
}

class _CheckUserLoginState extends State<CheckUserLogin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges() ,builder: (context,snapshot) {
   if (snapshot.hasData) {
     return HomePage();
   }
   else{
     return    LoginPage();
   }
    }),);
  }
}


