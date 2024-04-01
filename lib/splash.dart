//import 'package:chatt_client/Widgets/logout.dart';
import 'package:drawing_app/screen_home.dart';
import 'package:flutter/material.dart';


class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
 
  @override
  void initState() {
     
    checkUserLoggedIn();

    //ScreenLogout().sessionLogout(context);  //forcefull logout incase of infinite screen loading
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const SizedBox(
              height: 200,
              child: Image(image: AssetImage('assets/group.jpg'))),
             SizedBox(
            width: 50, height: 50, child: Image.asset('assets/splash.gif')
            ),
            const Text('Kidzee',
            style: TextStyle(
              color: Colors.pink,
              fontFamily: 'Georgia',
              fontSize: 25
            ),
            )
      
          ],
      )
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> checkUserLoggedIn() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => const ScreenHome()));
  }
}
