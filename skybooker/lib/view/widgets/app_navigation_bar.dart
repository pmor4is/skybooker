import 'package:flutter/material.dart';


class AppNavigationBar extends StatefulWidget {
  final String appBarName;
  const AppNavigationBar({
    Key? key,
    required this.appBarName,
  }) : super(key: key);

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.appBarName),
      backgroundColor: Color(0xFF6CABDF),
      centerTitle: true,
    );
  }
}