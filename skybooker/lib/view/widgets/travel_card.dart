import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/pages/travel_page.dart';

class TravelCard extends StatefulWidget {
  final Travel data;
  const TravelCard({super.key, required this.data});

  @override
  State<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.storage),
            title: Text(widget.data.destiny ?? "Destino indisponivel"),
            subtitle: Text(widget.data.description ?? "Descrição indisponível"),
            trailing: Text(widget.data.price ?? "Preço indisponível"),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: [
                ElevatedButton(
                  child: const Text("Comprar"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelPage(data: widget.data)));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
