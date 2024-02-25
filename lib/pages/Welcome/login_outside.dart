// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:jamera/pages/Welcome/signIn.dart';
// import 'package:jamera/pages/navigation_menu.dart';
import 'package:jamera/pages/parent_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:flutter_custom_buttons/flutter_custom_buttons.dart';
class LoginOutsideWidget extends StatefulWidget {
  const LoginOutsideWidget({super.key});

  @override
  State<LoginOutsideWidget> createState() => _LoginOutsideWidgetState();
}

class _LoginOutsideWidgetState extends State<LoginOutsideWidget> {
  bool showPassword = false;
  bool rememberPassword = false;
  var status = 404;
  String error = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleRemember() {
    setState(() {
      rememberPassword = !rememberPassword;
    });
  }

  void togglePassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    authentication() async {
      final response = await http.post(
        Uri.parse('https://gdsc-be.onrender.com/v1/user/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }),
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        String userRole = data['data']['information']['role'];
        String name = data['data']['information']['firstName'] +
            " " +
            data['data']['information']['lastName'];
        String phoneNumber = data['data']['information']['phoneNumber'];
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ParentPage(
                      role: userRole,
                      name: name,
                      phoneNumber: phoneNumber,
                    )));
      } else {
        setState(() {
          error = "Password Incorrect";
        });
      }
    }

    return Scaffold(
      // appBar: AppBar(title: const Text("")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 162, 24, 12),
            child: const Text(
              "Login to your account",
              style: TextStyle(
                  fontSize: 45,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
                child: Column(children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade100),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onChanged: (String value) => {},
                validator: (value) {
                  return value!.isEmpty ? 'Please enter email' : null;
                },
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                  child: Text(
                error,
                style: TextStyle(color: Colors.red),
              )),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: showPassword,
                decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    hintText: 'Enter password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: showPassword
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: togglePassword,
                      color: Colors.grey.shade900,
                    ),
                    border: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 1, color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                onChanged: (String value) => {},
                validator: (value) {
                  return value!.isEmpty ? 'Please enter password' : null;
                },
              ),
              SizedBox(
                height: 6.0,
              ),
              Row(
                children: [
                  Checkbox(
                      value: rememberPassword,
                      onChanged: (bool? value) {
                        toggleRemember();
                      }),
                  Text('Remember password')
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              MaterialButton(
                onPressed: () {
                  authentication();

                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ParentPage(
                  //               role: "userRole",
                  //               name: "name",
                  //               phoneNumber: "phoneNumber",
                  //             )));
                },
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.lightBlue[700],
                textColor: Colors.white,
                child: Text('Sign in'),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot the password?",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700),
                  ))
            ])),
          ),
          Divider(
            thickness: 1.0,
            indent: 30,
            endIndent: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 62, 10, 0),
            child: Row(
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInWidget()));
                  },
                  child: Text("Sign up",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
