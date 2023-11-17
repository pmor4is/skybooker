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
      body: Center(
        child: FutureBuilder(
          // Chamada da API
          future: Api.getTravel(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // Verificação de conexão
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              // Conexão aceita. Verificação de conteúdo
              if (snapshot.hasData) {
                List<Travel> travelData =
                    (snapshot.data as List<dynamic>).cast<Travel>();
                // Criação do conteúdo
                return ListView.builder(
                  itemCount: travelData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Travel travel = travelData[index];

                    // Chama o widget TravelCard, que contem a informação de estilização, com o index específico
                    // Esse index específico passa pela TravelCard, e vai para a página TravelPage
                    return TravelCard(
                      data: travelData[index],
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error loading data"),
                );
              } else {
                return const Center(
                  child: Text("No data received"),
                );
              }
            } else {
              return const Center(
                child: Text("Unexpected ConnectionState"),
              );
            }
          },
        ),
      ),
    );
  }
}
