import 'package:aktest/view/add_post.dart';
import 'package:aktest/view/screen/loginpage.dart';
import 'package:aktest/view/screen/registerPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
void requestPermission() async{
  FirebaseMessaging message=FirebaseMessaging.instance;
  NotificationSettings settings=await message.requestPermission(
    alert: true,announcement: false,badge: true,carPlay: true,sound: true,criticalAlert: true
  );
  if (settings.authorizationStatus==AuthorizationStatus.authorized) {


  }
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(message.notification?.title);
    print(message.notification?.body);
  });
}
@override
  void initState() {
    // TODO: implement initState
  requestPermission();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((value) => (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage()));
              });
            }, icon: Icon(Icons.exit_to_app,color: Colors.white,))
          ],
          backgroundColor: Colors.black87,
          title:   Text(
             "MY APP",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.post_add_sharp),onPressed: () async {
    showDialog(context: context, builder: (BuildContext context) => AddPost());
    await FirebaseMessaging.instance.getToken().then((value) => print(value));

  },),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){


                },
                child: Text("Goto Animation"),
              ),
              InkWell(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>  RegisterPage()));
                },
                child: Image.asset(
                  "assets/image/AK Flutter.png",
                  width: 300,
                  height: 300,
                ),
                
              ),Text(FirebaseAuth.instance.currentUser!.email!)
            ],
          ),
        ));
  }
}
