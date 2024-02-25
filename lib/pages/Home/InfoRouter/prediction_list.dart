import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:jamera/pages/Home/InfoRouter/info_graph_view.dart';
import 'package:jamera/pages/Home/InfoRouter/info_list_view.dart';

class PredictionListWiget extends StatefulWidget {
  const PredictionListWiget({super.key});

  @override
  State<PredictionListWiget> createState() => _PredictionListWigetState();
}

class _PredictionListWigetState extends State<PredictionListWiget> {
  int viewShow = 0;
  late final GroupButtonController controller;
  List<Map<String, String>> info = [
    {'date': "19/02", 'data': "20"},
    {'date': "19/02", 'data': "20"},
    {'date': "19/02", 'data': "20"},
    {'date': "19/02", 'data': "20"},
    {'date': "19/02", 'data': "20"},
    {'date': "19/02", 'data': "20"},
  ];
  void changeView(i) {
    setState(() {
      viewShow = i;
    });
  }

  @override
  void initState() {
    controller = GroupButtonController(selectedIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 0, 0,10),
          child: const Text("Traffic flow prediction", style: TextStyle(color: Color.fromARGB(255, 18, 65, 104), fontSize: 26, fontWeight: FontWeight.w700),),
        ),
        GroupButton(
          controller: controller,
          options: GroupButtonOptions(
            selectedShadow: [],
            selectedTextStyle: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
            selectedColor: Colors.blue.shade400,
            selectedBorderColor: Colors.blue[400],
            unselectedBorderColor: Colors.blue[100],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            spacing: 20,
            textPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            elevation: 0,
            groupingType: GroupingType.row,
          ),
          isRadio: true,
          onSelected: (val, i, selected) => changeView(i),
          buttons: const ["Traffic", "Duration"],
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
                    color: selected ? Colors.blue.shade300 : Colors.white),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: (index == 0)
                          ? Icon(
                              Icons.list_alt_sharp,
                              color: selected ? Colors.white : Colors.blue,
                            )
                          : Icon(
                              Icons.line_axis_rounded,
                              color: selected ? Colors.white : Colors.blue,
                            ),
                    ),
                    (index == 0)
                        ? Text("List View",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: selected ? Colors.white : Colors.blue,
                            ))
                        : Text("Graph View",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: selected ? Colors.white : Colors.blue,
                            ))
                  ],
                ),
              ),
            );
          },
        ),
        // InfoTableWidget(info: info),
        SizedBox(
          height: 20,
        ),
        Container(
          child: (viewShow == 0)
              ? InfoTableWidget(
                  info: info,
                )
              : InfoGraphViewWidget(info: info),
        )
      ],
    );
  }
}
