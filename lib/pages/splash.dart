import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_example/pages/homepage.dart';
import 'package:shared_pref_example/pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Timer(Duration(seconds: 3), () {
     checkLogin();
   });
  }
  checkLogin() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

   bool isLogin =  preferences.getBool('islogin') ?? false;
   if(isLogin){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
   }else{
     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
   }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 1,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: Image(
            height: MediaQuery.of(context).size.height * .3,
            width: MediaQuery.of(context).size.width * .6,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://i.pinimg.com/550x/45/16/eb/4516ebbb91731ae10aad45b99f592159.jpg')),
      ),
    );
  }
}
