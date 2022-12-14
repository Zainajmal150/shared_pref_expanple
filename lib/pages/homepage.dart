import 'package:flutter/material.dart';
import 'package:shared_pref_example/pages/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = ' ';
  String password = ' ';
  String age = ' ';
loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
     email = preferences.getString('email') ?? '';
     password = preferences.getString('password') ?? '';
     age = preferences.getString('age') ?? '';
     setState(() {

     });
  }
  @override
  void initState() {
    // TODO: implement initState
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "HomePage",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(email,style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
          SizedBox(height: 10,),
          Text(password,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
          SizedBox(height: 10,),
          Text(age,style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.white),
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.setBool('islogin', false);
                Navigator.push(context,MaterialPageRoute(builder: (context) => LoginPage(),));

              },
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}
