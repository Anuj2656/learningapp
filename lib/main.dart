import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learningapp/screen/home.dart';
import 'package:learningapp/screen/registration_screen.dart';
import 'package:learningapp/sem/1st_sem.dart';
import 'package:learningapp/sem/2nd_sem.dart';
import 'package:learningapp/sem/3rd_sem.dart';
import 'package:learningapp/sem/4th_sem.dart';
import 'package:learningapp/sem/5th_sem.dart';
import 'package:learningapp/sem/6th_sem.dart';
import 'package:learningapp/sem/7th_sem.dart';
import 'package:learningapp/sem/8th_sem.dart';
import 'component/round_button.dart';
import 'package:provider/provider.dart';
import 'package:learningapp/provider/auth_provider.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance
      .activate(
      androidProvider: AndroidProvider.playIntegrity,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,builder:(context,snapshot){
      if (snapshot.hasError) {
      }
      if (snapshot.connectionState == ConnectionState. waiting)
      {
        return const Center (child: CircularProgressIndicator()); }

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child:  MaterialApp(
          routes: {
            '/1st sem': (context) => FirstSem(),
            '/2nd sem': (context) => SecondSem(),
            '/3rd sem': (context) => ThirdSem(),
            '/4th sem': (context) => FourthSem(),
            '/5th sem': (context) => FifthSem(),
            '/6th sem': (context) => SixSem(),
            '/7th sem': (context) => SevenSem(),
            '/8th sem': (context) => EightSem(),
          },
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: const SplashScreen(),
        ),
      );

    } );
  }
}

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 10),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const homescreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Colors.deepPurpleAccent,Colors.white,]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  height: 600.0,
                  width: 600.0,
                ),
                const Text("ByteBooks \nA E-Learning Plateform ",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            const CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  bool _isLoading = false; // Added loading indicator state

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Colors.deepPurpleAccent,Colors.white,]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  height: 600.0,
                  width: 600.0,
                ),
                const Text("ByteBooks \nA E-Learning Plateform ",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                _isLoading
                    ? CircularProgressIndicator()
               : RoundedButton(
                    text: "Welcome",
                    press: () async  {
                      setState(() {
                        _isLoading = true; // Set loading state to true
                      });
                      if (ap.isSignedIn == true) {
                        await ap.getDataFromSP().whenComplete(
                              () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  homepage(),
                            ),
                          ),
                        );
                      }else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen (),
                          ),
                        );
                      }
                      setState(() {
                        _isLoading = false; // Set loading state to false after action is completed
                      });
                    }
                ),
              ],
            ),
          ],
        ),
    ),
    );
  }
}

/*
   body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,

              colors: [Colors.deepPurpleAccent,Colors.white,]
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/images/welcome.png",
                  height: 600.0,
                  width: 600.0,
                ),
                const Text("Study Material \nA E-Learning Plateform ",textAlign:TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),

            const CircularProgressIndicator(
              valueColor:  AlwaysStoppedAnimation<Color>(Colors.deepPurple),
            ),
          ],
        ),
      ),
 */