import 'package:flutter/material.dart';
import 'package:skybooker/controller/services.dart';
import 'package:skybooker/model/travel_model.dart';
import 'package:skybooker/view/widgets/app_navigation_bar.dart';
import 'package:skybooker/view/widgets/travel_card.dart';
import 'package:skybooker/view/widgets/web_navigation_bar.dart';
import '../widgets/responsive_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              preferredSize: Size(screenSize.width, 1000),
              child: const WebNavigationBar(),
            ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Descubra uma Nova Forma de Viajar: Compre suas Passagens Aéreas Conosco!',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BlueCardWithText(
              title: 'Os Melhores Preços:',
              content:
                  'Oferecemos tarifas competitivas que se encaixam no seu orçamento. Comparamos os preços das principais companhias aéreas para garantir que você obtenha o melhor negócio possível.',
            ),
            BlueCardWithText(
              title: 'Reservas Simples e Rápidas:',
              content:
                  'Nosso processo de reserva é fácil e rápido. Em apenas alguns cliques, você pode escolher o destino, selecionar as datas desejadas e garantir sua passagem, tudo sem complicações.',
            ),
            BlueCardWithText(
              title: 'Promoções Exclusivas:',
              content:
                  'Fique de olho em nossas promoções exclusivas! Oferecemos descontos especiais, códigos promocionais e ofertas sazonais para garantir que você economize ainda mais em suas viagens.',
            ),
            BlueCardWithText(
              title: 'Variedade de Destinos:',
              content:
                  'Explore uma ampla variedade de destinos! De praias paradisíacas a metrópoles animadas, temos opções para todos os tipos de viajantes.',
            ),
            BlueCardWithText(
              title: 'Suporte ao Cliente de Qualidade:',
              content:
                  'Nosso dedicado suporte ao cliente está disponível para ajudar em todas as etapas. Seja uma dúvida sobre a reserva ou uma solicitação especial, estamos aqui para tornar sua experiência o mais suave possível.',
            ),
            BlueCardWithText(
              title: 'Segurança e Confiabilidade:',
              content:
                  'Priorizamos a segurança e a confiabilidade. Seus dados pessoais e de pagamento são protegidos, proporcionando tranquilidade ao fazer suas transações conosco.',
            ),
            BlueCardWithText(
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
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
