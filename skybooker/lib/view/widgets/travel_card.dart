import 'package:flutter/material.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/pages/travel_detail.dart';

class TravelCard extends StatefulWidget {
  final Travel data;
  const TravelCard({super.key, required this.data});

  @override
  State<TravelCard> createState() => _TravelCardState();
}

class _TravelCardState extends State<TravelCard> {
  Widget cidadeSwitch() {
    switch (widget.data.destiny) {
      case 'Belo Horizonte':
        return Image.network(
            'https://i0.wp.com/www.wine.com.br/winepedia/wp-content/uploads/2019/12/11.12-BH.png?fit=1200%2C830&ssl=1',
            width: 175);
      case 'Sao Paulo':
        return Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKfn2RkjF8dMBCV1zqsMzHbBp7fx3RtDo2dAJ7B6QEv3lTD9Nmop4-iKLkalTSl36rIRw&usqp=CAU',
            width: 175);
      case 'Rio de Janeiro':
        return Image.network(
            'https://a.cdn-hotels.com/gdcs/production164/d1805/98266e71-fce6-45b5-b2d8-96335db481c6.jpg?impolicy=fcrop&w=800&h=533&q=medium',
            width: 175);
      default:
        return Image.network('https://url_para_imagem_default.com');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("foto"),
              Container(
                child: cidadeSwitch(),
              ),
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: const Text(
                  "De itabira a",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child: Text(
                  widget.data.destiny ?? "Destino indisponivel",
                  style: const TextStyle(
                    color:  Color(0xFF02529C),
                    fontSize: 23,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 50),
                child:
                    Text(widget.data.description ?? "Descrição indisponível"),
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 25),
                child: Text(
                  widget.data.price ?? "Preço indisponível",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 2, 82, 156),
                    // fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonTheme(
                child: ButtonBar(
                  children: [
                    ElevatedButton(
                      child: const Text(
                        "Comprar",
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 82, 156),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TravelDetail(data: widget.data)));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
