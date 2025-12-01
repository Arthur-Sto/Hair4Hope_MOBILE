import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Carrosel extends StatelessWidget {
  const Carrosel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> carouselitens = [
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/fotohome.webp",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(
                        153,
                      ), // 0.6 * 255 = 153
                      Colors.black.withAlpha(
                        26,
                      ), // 0.1 * 255 = 25.5
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                      255,
                      173,
                      7,
                      93,
                    ),
                    borderRadius:
                        BorderRadius.circular(5),
                  ),
                  child: const Text(
                    "Ver amorímetro",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Faça a diferença",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Sua doação pode transformar a vida\n"
                      "de quem luta contra o câncer",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/carrosel2.png",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withAlpha(
                        153,
                      ), // 0.6 * 255 = 153
                      Colors.black.withAlpha(
                        1,
                      ), // 0.1 * 255 = 25.5
                    ],
                  ),
                ),
              ),
              const Positioned(
                bottom: 10,
                left: 10,
                right: 16,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aprenda a \ndoar mechas!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Seus cabelos podem salvar\n"
                      "alguém, clique aqui e aprenda a doar!",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle:
                            FontStyle.italic,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      Image.asset(
        'assets/images/fotohome.webp',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/fotohome.webp',
        fit: BoxFit.cover,
      ),
      Image.asset(
        'assets/images/fotohome.webp',
        fit: BoxFit.cover,
      ),
    ];

    final controller = CarouselController(
      initialItem: 1,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 180,
        maxWidth:
            MediaQuery.sizeOf(context).width - 20,
      ),
      child: CarouselView.weighted(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        flexWeights: [1, 8, 1],
        itemSnapping: true,
        controller: controller,
        onTap: (index) {
          switch (index) {
            case 0:
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const AmorimetroPopUp();
                },
              );
            case 1:
            // Ação para o item do meio
          }
        },
        children: carouselitens,
      ),
    );
  }
}

class AmorimetroPopUp extends StatelessWidget {
  const AmorimetroPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: const Color(0xFFFDE7F3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: const Text(
        'Amorímetro',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      titlePadding: EdgeInsetsGeometry.only(
        top: 0,
      ),
      children: [
        FutureBuilder<String>(
          future: getUrl(),
          builder: (context, snapshot) {
            if (snapshot.connectionState ==
                ConnectionState.waiting) {
              // return const CircularProgressIndicator();
              return Column(
                children: [
                  Image.network(
                    'https://img1.wsimg.com/isteam/ip/fa410d90-5d99-4398-b8ed-dfe92b942853/amorimetro%20site%20(1)-373b361.png',
                  ),
                  Text(
                    'Atualizando...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(
                'Erro: ${snapshot.error}',
              );
            } else if (!snapshot.hasData) {
              return const Text(
                'Nenhuma imagem encontrada',
              );
            } else {
              return Image.network(
                snapshot.data!,
              );
            }
          },
        ),
        Divider(),
        Text(
          'Nosso Amorímetro conta quantos Kits do Amor foram doados desde 08/03/2017',
          textAlign: TextAlign.center,
        ),
        Divider(),
      ],
    );
  }
}

Future<String> getUrl() async {
  final imageData = await fetch();
  try {
    return imageData['img'];
  } catch (e) {
    throw Exception('Erro ao buscar imagem: $e');
  }
}

Future<Map<String, dynamic>> fetch() async {
  var url = Uri.https(
    'hair4hope-backend.onrender.com',
    '/amorimetro',
  );

  var response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body)
        as Map<String, dynamic>;
  } else {
    throw Exception(
      'Falha ao carregar dados. Status: ${response.statusCode}',
    );
  }
}
