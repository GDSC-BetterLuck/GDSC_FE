import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:jamera/pages/CameraSurvey/fine_items.dart';

class CameraSurveyWidget extends StatefulWidget {
  const CameraSurveyWidget({super.key});

  @override
  State<CameraSurveyWidget> createState() => _CameraSurveyWidgetState();
}

class _CameraSurveyWidgetState extends State<CameraSurveyWidget> {
  bool shownCam = false;
  void showCamHandler(){
    setState(() {
      shownCam = true;
    });
  }
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
                        onPressed: () {
                          showCamHandler();
                        },
                        splashColor: Colors.blue,
                        tooltip: 'Find road',
                        icon: const Icon(Icons.search)),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 253, 248, 248),
                  )),
              SizedBox(height: 20,),
              (shownCam) ? Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: const  BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/traffic.png"),
                      )
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text("History", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                  const Divider(thickness: 1, height: 15, indent: 40, endIndent: 40,),
                  const FineItems(date: "20/12",time: "19:00", type: "Red Light Traffic ", trafficPlate: "51G-89112"),
                  const FineItems(date: "01/01",time: "19:00", type: "Turn Left Wrong Lane", trafficPlate: "51G-12383"),
                  const FineItems(date: "20/01",time: "19:00", type: "Turn Right Wrong Lane", trafficPlate: "51G-31412"),
                  const FineItems(date: "25/01",time: "19:00", type: "Over Speed Limit ", trafficPlate: "51G-41726"),
                  const FineItems(date: "01/02",time: "19:00", type: "Red Light Traffic ", trafficPlate: "51G-71655"),

                ],
              ): Text("Enter road name to show its survey camera"),
            ],
          ),
        ),
      ),
    );
  }
}
