import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/pages/travel_page.dart';

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
        return Image.network('https://i0.wp.com/www.wine.com.br/winepedia/wp-content/uploads/2019/12/11.12-BH.png?fit=1200%2C830&ssl=1', width: 175);
      case 'Sao Paulo':
        return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKfn2RkjF8dMBCV1zqsMzHbBp7fx3RtDo2dAJ7B6QEv3lTD9Nmop4-iKLkalTSl36rIRw&usqp=CAU', width: 175);
      case 'Rio de Janeiro':
        return Image.network('https://a.cdn-hotels.com/gdcs/production164/d1805/98266e71-fce6-45b5-b2d8-96335db481c6.jpg?impolicy=fcrop&w=800&h=533&q=medium', width: 175);
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
        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text("foto"),
              Container(
              child: cidadeSwitch(),
              //  Image(
              //     image: NetworkImage('https://a.cdn-hotels.com/gdcs/production164/d1805/98266e71-fce6-45b5-b2d8-96335db481c6.jpg?impolicy=fcrop&w=800&h=533&q=medium'),
              //     height: 125,
              // ),
            ),
              
//               const Image(
//   image: NetworkImage('https://a.cdn-hotels.com/gdcs/production164/d1805/98266e71-fce6-45b5-b2d8-96335db481c6.jpg?impolicy=fcrop&w=800&h=533&q=medium'),
// )
            ],
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(left:50),
                child: Text(
                "De itabira a",
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(left:50),
                child: Text(widget.data.destiny ?? "Destino indisponivel",
                style: 
                  TextStyle(
                    color: Color.fromARGB(255, 2, 82, 156),
                    fontSize: 23,
                  ),
          
                ),
              ), 
               Container(
                margin: EdgeInsets.only(left:50),
                child: Text(widget.data.description ?? "Descrição indisponível"),
              ),
               
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right:25),
                child: Text(widget.data.price ?? "Preço indisponível",
                style: 
                  TextStyle(
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
                  child: const Text("Comprar",
                  style: 
                  TextStyle(
                    color: Color.fromARGB(255, 2, 82, 156),
                  ),),
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
          

          
          // ListTile(
          //   leading: const Icon(Icons.storage),
          //   title: Text(widget.data.destiny ?? "Destino indisponivel"),
          //   subtitle: Text(widget.data.description ?? "Descrição indisponível"),
          //   trailing: Text(widget.data.price ?? "Preço indisponível"),
          // ),
          
          // ButtonTheme(
          //   child: ButtonBar(
          //     children: [
          //       ElevatedButton(
          //         child: const Text("Comprar"),
          //         onPressed: () {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                 builder: (context) => TravelPage(data: widget.data)));
          //         },
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
