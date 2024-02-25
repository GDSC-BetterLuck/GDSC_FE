import 'package:flutter/material.dart';

class InfoItemCard extends StatefulWidget {
  const InfoItemCard({super.key, required this.infoName, required this.value, required this.icon});
  final String infoName;
  final String value;
  final IconData icon;
  @override
  State<InfoItemCard> createState() => _InfoItemCardState();
}

class _InfoItemCardState extends State<InfoItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(widget.icon,color: Colors.red),
            SizedBox(width: 20,),
            Expanded(
              child: Text(widget.infoName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
            ),
            Text(widget.value, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)
          ],
        ),
      ),
    );
  }
}