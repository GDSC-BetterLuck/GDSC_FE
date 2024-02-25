import 'package:flutter/material.dart';

class CameraSurveyWidget extends StatefulWidget {
  const CameraSurveyWidget({super.key});

  @override
  State<CameraSurveyWidget> createState() => _CameraSurveyWidgetState();
}

class _CameraSurveyWidgetState extends State<CameraSurveyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/logo/small_logo_resize.png"))),
            margin: EdgeInsets.only(left: 15.0),
          ),
          title: Container(
            alignment: AlignmentDirectional.topStart,
            child: const Text(
              "Survey for police",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                  controller: null,
                  onTap: null,
                  onTapOutside: (event) => {FocusScope.of(context).unfocus()},
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.edit_road_rounded),
                    labelText: 'Enter road name to find',
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10.0)),
                    suffixIcon: IconButton(
                        onPressed: () {},
                        splashColor: Colors.blue,
                        tooltip: 'Find road',
                        icon: const Icon(Icons.search)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 248, 248),
                  )),
              
            ],
          ),
        ),
      ),
    );
  }
}
