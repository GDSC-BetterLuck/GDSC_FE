// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:jamera/pages/Welcome/radio_button.dart';

// import 'package:jamera/pages/Welcome/login_outside.dart';
// import 'package:flutter_custom_buttons/flutter_custom_buttons.dart';
class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool showPassword = false;
  bool rememberPassword = false;
  late GroupButtonController _radioController;
  final _radioButtons = [
    'Normal User',
    'Police Officer',
  ];
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
  void initState() {
    _radioController = GroupButtonController(selectedIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 102, 24, 12),
            child: const Text(
              "Create your account",
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
              const SizedBox(
                height: 30,
              ),
              TextFormField(
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
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: showPassword,
                decoration: InputDecoration(
                    labelText: 'Confirm Password',
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
                height: 18.0,
              ),
              Center(
                child: GroupButton(
                  controller: _radioController,
                  isRadio: true,
                  options: GroupButtonOptions(groupingType: GroupingType.column),
                  buttons: _radioButtons,
                  buttonIndexedBuilder: (selected, index, context) {
                    return RadioTile(
                      title: _radioButtons[index],
                      selected: _radioController.selectedIndex,
                      index: index,
                      onTap: () {
                        _radioController.selectIndex(index);
                      },
                    );
                  },
                  onSelected: (val, i, selected) =>
                      debugPrint('Button: $val index: $i $selected'),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              MaterialButton(
                onPressed: () {},
                minWidth: double.infinity,
                height: 50.0,
                color: Colors.lightBlue[700],
                textColor: Colors.white,
                child: Text('Sign up'),
              ),
              SizedBox(
                height: 10.0,
              )
            ])),
          ),
          Divider(
            thickness: 1.0,
            indent: 30,
            endIndent: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 12, 10, 0),
            child: Row(
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Sign in",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
