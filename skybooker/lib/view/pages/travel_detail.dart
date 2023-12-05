import 'package:flutter/material.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/widgets/app_navigation_bar.dart';
import 'package:skybooker/view/widgets/responsive_widget.dart';
import 'package:skybooker/view/widgets/web_navigation_bar.dart';

class TravelDetail extends StatefulWidget {
  final Travel data;

  const TravelDetail({Key? key, required this.data}) : super(key: key);

  @override
  State<TravelDetail> createState() => _TravelDetailState();
}


class _TravelDetailState extends State<TravelDetail> {
  List<bool> isSelected = List.generate(100, (index) => false);
  int contpolts = 0;

  @override
  Widget build(BuildContext context) {
    double precoPasg = double.parse(widget.data.price!);

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: const AppNavigationBar(
                appBarName: 'Viagem selecionada\nSeleção de assentos:',
              ),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: const WebNavigationBar(),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Parte acima do Expanded
            Container(
              margin: EdgeInsets.all(8.0),
              child: Text(
                'Selecione o assento:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Expanded contendo o GridView e a Coluna à direita
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Parte central com o GridView
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        crossAxisSpacing: 1,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: 100,
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return FilterChip(
                          label: Text('${index + 1}'),
                          selected: isSelected[index],
                          onSelected: (selected) {
                            setState(() {
                              isSelected[index] = !isSelected[index];
                              contpolts = isSelected
                                  .where((isSelected) => isSelected)
                                  .length;
                            });
                          },
                          selectedColor: Colors.green,
                        );
                      },
                    ),
                  ),
                  SizedBox(width: 11),
                  // Coluna à direita
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Destino: ${widget.data.destiny}'),
                        SizedBox(height: 8),
                        Text('Descrição: ${widget.data.description}'),
                        SizedBox(height: 8),
                        Text('Preço da passagem: ${widget.data.price}'),
                        SizedBox(height: 8),
                        Text('Preço final: ${contpolts * precoPasg}')
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}