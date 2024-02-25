import 'package:flutter/material.dart';
import 'package:jamera/pages/Community/post_about_router.dart';
import 'package:jamera/pages/Home/InfoRouter/prediction_list.dart';
import 'package:jamera/pages/Home/InfoRouter/traffic_camera.dart';
class InfoRouter extends StatefulWidget {
  const InfoRouter({super.key, required this.index});
  final int index;
  @override
  State<InfoRouter> createState() => _InfoRouterState();
}

class _InfoRouterState extends State<InfoRouter> {
  @override
  Widget build(BuildContext context) {
    return (widget.index == 0) ? const TrafficCameraWidget() : (widget.index == 1) ? const PredictionListWiget():  const PostAboutRouter();
  }
}