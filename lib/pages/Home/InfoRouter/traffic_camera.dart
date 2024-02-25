import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:jamera/pages/Home/InfoRouter/info_item_card.dart';

class TrafficCameraWidget extends StatefulWidget {
  const TrafficCameraWidget({super.key});

  @override
  State<TrafficCameraWidget> createState() => _TrafficCameraWidgetState();
}

class _TrafficCameraWidgetState extends State<TrafficCameraWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 350,
          height: 150,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/traffic2.png"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 5, 5, 5),
          child: Card(
              color: Colors.white,
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.white,
              child: Row(children: [
                const Expanded(
                    child: ListTile(
                        title: Text(
                          "Cong Hoa street",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 20),
                        ),
                        subtitle: Text("7 District, Ho Chi Minh City"))),
                Row(children: [
                  IconButton(
                      onPressed: () {},
                      color: Colors.black,
                      icon: const Icon(Icons.stacked_line_chart_outlined))
                ])
              ])),
        ),
        GroupButton(
          controller: null,
          options: const GroupButtonOptions(
            selectedShadow: [],
            selectedTextStyle: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            selectedColor: Colors.white,
            selectedBorderColor: Colors.white,
            unselectedBorderColor: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            spacing: 20,
            textPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            elevation: 0,
            groupingType: GroupingType.row,
          ),
          isRadio: true,
          onSelected: null,
          buttons: const ["", "", ""],
          buttonIndexedBuilder: (selected, index, context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Container(
                alignment: Alignment.center,
                padding: (index == 1)
                    ? const EdgeInsets.fromLTRB(20, 5, 26, 5)
                    : const EdgeInsets.fromLTRB(5, 5, 15, 5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.shade500),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: (index == 0)
                          ? const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                            )
                          : (index == 1)
                              ? const Icon(
                                  Icons.timer_rounded,
                                  color: Colors.blue,
                                )
                              :const Icon(
                                  Icons.time_to_leave,
                                  color: Colors.blue,
                                ),
                    ),
                    (index == 0)
                        ? const Text("2 km",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ))
                        : (index == 1)
                            ? const Text("8AM - 10AM",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ))
                            : const Text("Car",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ))
                  ],
                ),
              ),
            );
          },
        ),
        SizedBox(height: 20,),
        Card(
          elevation: 0,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Road measurement", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue.shade400),),
              ),
              const InfoItemCard(infoName: 'Traffic jam level', value: 'Hard(E)', icon: Icons.car_crash),
              const InfoItemCard(infoName: 'Temperature', value: '40 Celcius', icon: Icons.sunny),
              const InfoItemCard(infoName: 'UV', value: 'Level 10', icon: Icons.location_searching_outlined),
            ],
          ),
        )
      ],
    );
  }
}
