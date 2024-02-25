import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/widgets.dart';
import 'package:group_button/group_button.dart';
import 'package:jamera/pages/Home/info_router.dart';

class SearchPageResult extends StatefulWidget {
  const SearchPageResult({super.key});
  
  @override
  State<SearchPageResult> createState() => _SearchPageResultState();
}

class _SearchPageResultState extends State<SearchPageResult> {
  
  late GroupButtonController controllerGroupButton;
  
  int groupButtonIndexSelected = 0;
  void groupButtonSelected(int index) {
    setState(() {
      groupButtonIndexSelected = index;
    });  
  }
  @override
  void initState(){
    controllerGroupButton = GroupButtonController(
      selectedIndex: 0
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: 0.1,
        maxChildSize: 0.9,
        // initialChildSize: 0.3,
        builder: (context, scrollController) => Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              padding: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  controller: scrollController,
                  children: [
                    Divider(
                      height: 10,
                      thickness: 3,
                      color: Colors.grey.shade400,
                      indent: 170,
                      endIndent: 170,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 1),
                            child: Text(
                              "Details",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.cancel_sharp, size: 35,)),
                      ],
                    ),
                    GroupButton(
                      controller: controllerGroupButton,
                      options: GroupButtonOptions(
                        selectedShadow: [],
                        selectedTextStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        selectedColor: Colors.blue.shade400,
                        selectedBorderColor: Colors.blue[400],
                        unselectedBorderColor: Colors.blue[100],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        spacing: 20,
                        textPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        elevation: 0,
                        groupingType: GroupingType.row,
                      ),
                      isRadio: true,
                      onSelected: (val,i, selected) => groupButtonSelected(i),
                      buttons: const ["Traffic", "Duration", "Mode"],
                      buttonIndexedBuilder: (selected, index, context) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                          child: Container(
                            alignment: Alignment.center,
                            padding: (index == 1) ? const EdgeInsets.fromLTRB(20, 5, 26, 5): const EdgeInsets.fromLTRB(5, 5, 15, 5),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue.shade500),
                              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                              color: selected ? Colors.blue.shade300 : Colors.white
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                  child: (index ==  0) ? Icon(Icons.location_on, color: selected ? Colors.white: Colors.blue,) :
                                         (index == 1) ?  Icon(Icons.query_stats_outlined, color: selected ? Colors.white: Colors.blue,):
                                                         Icon(Icons.info, color: selected ? Colors.white: Colors.blue,),
                                ),
                                (index ==  0) ? Text("Traffic", style: TextStyle(fontWeight: FontWeight.w500, color: selected ? Colors.white: Colors.blue,) ) :
                                (index == 1) ?  Text("Prediction",style: TextStyle(fontWeight: FontWeight.w500,color: selected ? Colors.white: Colors.blue,) ):
                                                Text("Info",style: TextStyle(fontWeight: FontWeight.w500,color: selected ? Colors.white: Colors.blue,) )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const Divider(thickness: 1, height: 40, indent: 20, endIndent: 20,),
                    InfoRouter(index: groupButtonIndexSelected)
                  ],
                ),
              ),
            ));
  }
}
