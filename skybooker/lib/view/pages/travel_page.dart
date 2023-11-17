import 'package:flutter/material.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/widgets/app_navigation_bar.dart';
import 'package:skybooker/view/widgets/responsive_widget.dart';
import 'package:skybooker/view/widgets/web_navigation_bar.dart';

class TravelPage extends StatefulWidget {
  final Travel data;
  const TravelPage({super.key, required this.data});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? PreferredSize(
              preferredSize: Size(screenSize.height, 100),
              child: const AppNavigationBar(appBarName: 'Viagem selecionada',),
            )
          : PreferredSize(
              // for larger & medium screen sizes
              preferredSize: Size(screenSize.width, 1000),
              child: const WebNavigationBar(),
            ),
      body: Center(
        child: Column(
          children: [
            Text("Destino: ${widget.data.destiny}"),
            Text("Descrição: ${widget.data.description}"),
            Text("Preço: ${widget.data.price}"),
          ],
        ),

      ),
    );
  }
}