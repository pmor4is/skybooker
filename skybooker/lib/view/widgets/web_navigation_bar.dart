import 'package:flutter/material.dart';
import 'package:skybooker/view/pages/home_page.dart';
import 'package:skybooker/view/pages/travels_page.dart';

class WebNavigationBar extends StatelessWidget {
  const WebNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: const Color(0xFF6CABDF),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: ((context) => const HomePage())),
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      '/home/veg4punk/workspace/skybooker/skybooker/assets/itabiraAirlines.png',
                      height: 40, 
                      width: 40, 
                    ),
                    const SizedBox(width: 10), // ajuste o espaçamento conforme necessário
                    const Text('Skybooker'),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const HomePage()),
                          ),
                        );
                      },
                      child: const Text(
                        'Página inicial',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => const TravelsPage()),
                          ),
                        );
                      },
                      child: const Text(
                        'Viagens',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
