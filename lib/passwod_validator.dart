import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:lottie/lottie.dart';

class password_validator extends StatefulWidget {
  const password_validator({super.key});

  @override
  State<password_validator> createState() => _password_validatorState();
}

class _password_validatorState extends State<password_validator> {
  @override
  bool isSuccess = false; //for initially
  bool _obsecure = true;
  final TextEditingController controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Text("Password Validator"),
            titleTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: isSuccess
                        ? Lottie.network(
                            "https://lottie.host/5b88e292-dbf1-44a8-b39b-bf88c494af4c/X20OtlejGz.json")
                        : Lottie.network(
                            "https://lottie.host/1f6f8a89-727a-439a-bcb4-03f1bdc7dca2/4qKpidnE6Y.json")),
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextField(
                        obscureText: _obsecure,
                        controller: controller,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: isSuccess ? Colors.green : Colors.red,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Password",
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _obsecure = !_obsecure;
                                });
                              },
                              icon: Icon(_obsecure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //   the main part of code which is validation part
                      FlutterPwValidator(
                        defaultColor: Colors.grey,
                        uppercaseCharCount: 1,
                        lowercaseCharCount: 1,
                        normalCharCount: 1,
                        numericCharCount: 1,
                        specialCharCount: 1,
                        width: 350,
                        height: 200,
                        minLength: 8,//password length should be atleast eight/8 charactor length
                        onSuccess: () {
                          setState(() {
                            isSuccess=true;
                          });
                        },
                        onFail: (){
                          isSuccess=false;
                        },
                        controller: controller,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
