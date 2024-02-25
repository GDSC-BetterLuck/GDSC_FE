import 'package:flutter/material.dart';
import 'package:jamera/pages/Home/InfoRouter/info_item_card.dart';


class InfoTableWidget extends StatefulWidget {
  const InfoTableWidget({super.key, required this.info});
  final List<Map<String, String>> info;
  
  @override
  State<InfoTableWidget> createState() => _InfoTableWidgetState();
}
// Widget dataWidgets( List<Map<String, String>> infoData){
//   return 
// }
class _InfoTableWidgetState extends State<InfoTableWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfoItemCard(infoName: "21/02 13:30", value: "30", icon: Icons.circle),
        InfoItemCard(infoName: "21/02 15:30", value: "40", icon: Icons.circle),
        InfoItemCard(infoName: "21/02 17:30", value: "50", icon: Icons.circle),
        InfoItemCard(infoName: "21/02 19:30", value: "70", icon: Icons.circle),
        InfoItemCard(infoName: "21/02 21:30", value: "50", icon: Icons.circle),
      ],
    );
  }
}

