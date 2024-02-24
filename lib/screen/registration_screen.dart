import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:learningapp/component/round_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  /*Future<void>sendPhoneNumber() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    setState(() {
      loading = true;
    });
      ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }*/
  Future<void> sendPhoneNumber() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    setState(() {
      loading = true;
    });
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(width: 16.0),
                Text('Generating OTP...'),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    loading = Provider.of<AuthProvider>(context, listen: true).isLoading;
        phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: loading,
        progressIndicator: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple)),
        child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFFe6fff3),
                        Colors.white,
                      ]
                  ),
                ),
            child: SingleChildScrollView(
            child: Column(
    children :[
              const SizedBox(height: 20),
    Image.asset(
    'assets/images/registration.png',
    ),
        const SizedBox(height: 60),
              const Text(
                "Register",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Add your phone number. We'll send you a verification code",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),
              Form(
             key: _formKey,
                child: Column(
                children: [
                  TextFormField(
             key: const ValueKey('Phone'),
                    cursorColor: Colors.green,
                    controller: phoneController,
                   validator: (val) {
                  if (val == null || val.isEmpty) {
                  return 'Please Enter your Phone.no';
                       }
                  String pattern = r'^[0-9]{10}$';
                  RegExp regExp = RegExp(pattern);
                   if(!regExp.hasMatch(val)){
                    return 'format of the Phone.no provided is incorrect';
                  }
                        return null;
                       },
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: "Enter phone number",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black12),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                                context: context,
                                countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 550,
                                ),
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                });
                          },
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry
                                .phoneCode}",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      suffixIcon: phoneController.text.length > 9
                          ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                          : null,
                    ),
                  ),
    ],
              ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 50,
              ),
              RoundedButton2(
                text: "Login",
                  press: () async {
                if (_formKey.currentState!.validate()) {
                  setState(() {

                    loading = true;
                  });
               await sendPhoneNumber();
                  setState(() {
                    loading = true;
                  });
                 }
              },

                  ),
                ],
              ),
            ),
          ),
      ),
      );
    }
  }



