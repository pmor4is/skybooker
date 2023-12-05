import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skybooker/view/widgets/app_navigation_bar.dart';
import 'package:skybooker/view/widgets/web_navigation_bar.dart';

import '../widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    final List<String> landscapeImages = [
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1501785888041-af3ef285b470?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1511576661531-b34d7da5d0bb?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ];

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? PreferredSize(
              preferredSize: Size(screenSize.height, 80),
              child: const AppNavigationBar(
                appBarName: "Homepage",
              ),
            )
          : PreferredSize(
              preferredSize: Size(screenSize.width, 1000),
              child: const WebNavigationBar(),
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 2.0,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                items: landscapeImages.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Descubra uma Nova Forma de Viajar: Compre suas Passagens Aéreas Conosco!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Os Melhores Preços:',
              content:
                  'Oferecemos tarifas competitivas que se encaixam no seu orçamento. Comparamos os preços das principais companhias aéreas para garantir que você obtenha o melhor negócio possível.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Reservas Simples e Rápidas:',
              content:
                  'Nosso processo de reserva é fácil e rápido. Em apenas alguns cliques, você pode escolher o destino, selecionar as datas desejadas e garantir sua passagem, tudo sem complicações.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Promoções Exclusivas:',
              content:
                  'Fique de olho em nossas promoções exclusivas! Oferecemos descontos especiais, códigos promocionais e ofertas sazonais para garantir que você economize ainda mais em suas viagens.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Variedade de Destinos:',
              content:
                  'Explore uma ampla variedade de destinos! De praias paradisíacas a metrópoles animadas, temos opções para todos os tipos de viajantes.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Suporte ao Cliente de Qualidade:',
              content:
                  'Nosso dedicado suporte ao cliente está disponível para ajudar em todas as etapas. Seja uma dúvida sobre a reserva ou uma solicitação especial, estamos aqui para tornar sua experiência o mais suave possível.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Segurança e Confiabilidade:',
              content:
                  'Priorizamos a segurança e a confiabilidade. Seus dados pessoais e de pagamento são protegidos, proporcionando tranquilidade ao fazer suas transações conosco.',
            ),
            const SizedBox(height: 20),
            const BlueCardWithText(
              title: 'Ao escolher nosso site para suas passagens aéreas...',
              content:
                  'Ao escolher nosso site para suas passagens aéreas, você está optando por uma jornada de viagem mais prática, acessível e repleta de vantagens. Descubra o mundo de maneira simples e econômica – comece sua próxima aventura conosco!',
            ),
          ],
        ),
      ),
    );
  }
}

class BlueCardWithText extends StatelessWidget {
  final String title;
  final String content;

  const BlueCardWithText({
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF6CABDF),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
