/*
import 'package:flutter/material.dart';
class WelcomePage extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final ImageProvider<Object> imageProvider;


  WelcomePage({
    Key? key,
    required this.name,
    required this.email,
    required this.phone,
    required this.imageProvider,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState(
    name: name,
    email: email,
    phone: phone,

    imageProvider: imageProvider,
  );
}

class _WelcomePageState extends State<WelcomePage> {

  String name;
  String email;
  String phone;

  ImageProvider<Object> imageProvider;
  _WelcomePageState({
    required this.name,
    required this.email,
    required this.phone,

    required this.imageProvider,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFBB94AF),
          title:  Text('Howdy $name!!'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFF2C3E50),
                  image: DecorationImage(
                    image: AssetImage('assets/images/side.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: imageProvider,
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child:
                      Text(
                        name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight:FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text( '$email',
                  style: const TextStyle(
                      color: Color(0xFF2C3E50),
                      fontSize: 16.0,
                      fontWeight:FontWeight.bold
                  ),
                ),
                leading: const Icon(Icons.email,
                  color: Color(0xFF2C3E50),
                ),
              ),
              ListTile(
                title: Text('$phone',
                  style: const TextStyle(
                      color: Color(0xFF2C3E50),
                      fontSize: 16.0,
                      fontWeight:FontWeight.bold
                  ),
                ),
                leading: const Icon(Icons.phone,
                  color: Color(0xFF2C3E50),
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }
}

 */

