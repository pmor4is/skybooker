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
        color: Colors.blue,
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
                      'view/assets/itabiraAirlines.png',
                      height: 40, 
                      width: 40, 
                    ),
                    SizedBox(width: 10), // ajuste o espaçamento conforme necessário
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
                            builder: ((context) => const TravelsPage()),
                          ),
                        );
                      },
                      child: const Text(
                        'Viagens',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: screenSize.width / 20),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Contact Us',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(
                width: screenSize.width / 50,
              ),
              InkWell(
                onTap: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
