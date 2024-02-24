import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learningapp/component/round_button.dart';
import 'package:learningapp/model/user_model.dart';
import 'package:learningapp/provider/auth_provider.dart';
import 'package:learningapp/screen/home.dart';
import 'package:learningapp/utils/utils.dart';
import 'package:provider/provider.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {
  File? image;
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/reg.jpg'),
            fit: BoxFit.cover,
          )
        ),
         child: Stack(
           children: <Widget>[
             Opacity(
               opacity: 0.5, // Adjust opacity for the desired dimming effect
               child: Container(
                 color: Colors.black,
               ),
             ),
           Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 80),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text(
                        "Signup",
                        style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Join our Community",
                        style: TextStyle(color: Colors.white, fontSize: 28,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Learn new things and explore the world",
                        style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => selectImage(),
                          child: image == null
                              ? const CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Color(0xFFFFC0D0),
                            child: Icon(
                              Icons.account_circle,
                              size: 50,
                              color: Colors.white,
                            ),
                          )
                              : CircleAvatar(
                            backgroundImage: FileImage(image!),
                            radius: 80,
                          ),
                        ),
                       const SizedBox(height:10,),
                        Form(
                          key: _globalKey,
                          child: Column(
                            children: <Widget>[
                              nameTextField(),
                              const SizedBox(
                                height: 20,
                              ),
                              emailTextField(),
                              const SizedBox(
                                height: 20,
                              ),
                              bioTextField(),
                              const SizedBox(
                                height: 20,
                                width: double.infinity,
                              ),
                              RoundedButton3(
                                text: "Continue",
                                press: () async {
                                  if (_globalKey.currentState!.validate()) {
                                    storeData();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
         ),
        ),
      );
  }
  Widget nameTextField()
  {
    return TextFormField(
      controller: nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your name";
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width:2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        prefixIcon: Icon(
          Icons.person,
         color: Colors.pink
        ),
        labelText: "Name",
        hintText: "Enter your name",
        filled: true,
        fillColor:Color(0xFFffe6e6),
      ),

    );
  }
  Widget emailTextField()
  {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your email";
        } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width:2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        prefixIcon: Icon(
          Icons.mail_outline_rounded,
         color: Colors.pink
        ),
        labelText: "Email",
        hintText: "Enter your Email",
        filled: true,
        fillColor: Color(0xFFffe6e6),
      ) ,
    );
  }
  Widget bioTextField()
  {
    return TextFormField(
      controller: bioController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Please enter your Bio";
        }
        return null;
      },
      maxLines: 3,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlueAccent,
            width:2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(29)),
        ),
        prefixIcon: Icon(
          Icons.my_library_books,
         color: Colors.pink
        ),
        labelText: "Bio",
        hintText: "Enter your Bio",
        filled: true,
        fillColor: Color(0xFFffe6e6),
      ) ,
    );
  }
  // store user data to database
  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      ap.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          ap.saveUserDataToSP().then(
                (value) => ap.setSignIn().then(
                  (value) => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  homepage(),
                  ),
                      (route) => false),
            ),
          );
        },
      );
    } else {
      showSnackBar(
          context, "Please upload your profile photo");
    }
  }
}
