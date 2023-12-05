import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/widgets/app_navigation_bar.dart';
import 'package:skybooker/view/widgets/travel_card.dart';
import 'package:skybooker/view/widgets/web_navigation_bar.dart';

import '../widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? PreferredSize(
              preferredSize: Size(screenSize.height, 80),
              child: const AppNavigationBar(
                appBarName: "Homepage",
              ),
            )
          : PreferredSize(
              // for larger & medium screen sizes
              preferredSize: Size(screenSize.width, 1000),
              child: const WebNavigationBar(),
            ),
      body: Container( alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('Bem vindo a Home Page', style: TextStyle(fontSize: 20,),)
        ],
      )
    ),
    );
  }
}
