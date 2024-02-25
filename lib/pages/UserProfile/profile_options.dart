import 'package:flutter/material.dart';
import 'package:jamera/pages/Welcome/login_outside.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget(
      {super.key, required this.name, required this.phoneNumber});
  final String name;
  final String phoneNumber;
  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

Widget cardCreator(IconData icon, String cardName, Function callback) {
  return MaterialButton(
    padding: EdgeInsets.zero,
    onPressed: () {
      callback();
    },
    child: Card(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 0.3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              weight: 1.9,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              cardName,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    ),
  );
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo/small_logo_resize.png"))),
            margin: EdgeInsets.only(left: 16.0),
          ),
          title: Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Profile",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/logo/small_logo.png"))),
              ),
              Text(
                (widget.name.isNotEmpty) ? widget.name : "Phong cute",
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.8),
              ),
              Text(
                (widget.phoneNumber.isNotEmpty) ? widget.phoneNumber : "08273153***",
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.1),
              ),
              const Divider(
                height: 40,
                thickness: 1.5,
              ),
              cardCreator(Icons.person_outline_sharp, "Edit profile", () {}),
              const SizedBox(
                height: 19,
              ),
              cardCreator(Icons.security_rounded, "Security", () {}),
              const SizedBox(
                height: 19,
              ),
              cardCreator(Icons.help, "Connect us", () {}),
              const SizedBox(
                height: 19,
              ),
              cardCreator(Icons.logout, "Logout", () {
                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  // settings: RouteSettings(name: LoginOutsideWidget.routeName),
                  screen: const LoginOutsideWidget(),
                  withNavBar: false,
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
                );
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const LoginOutsideWidget()));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
