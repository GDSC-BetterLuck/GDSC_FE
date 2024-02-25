import 'package:flutter/material.dart';

class FineItems extends StatefulWidget {
  const FineItems({
    super.key,
    required this.date,
    required this.time,
    required this.type,
    required this.trafficPlate,
    
  });
  final String date;
  final String type;
  final String trafficPlate;
  final String time;
  @override
  State<FineItems> createState() => _FineItemsState();
}

class _FineItemsState extends State<FineItems> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [Text(widget.date, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),),Text(" - "),Text(widget.time, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)), Text(" : "), Text(widget.type)],
                )),
                Text(widget.trafficPlate,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900))
                // Icon(Icons.circle)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
