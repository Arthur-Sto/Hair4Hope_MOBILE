import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(
              38,
            ), // 0.15 * 255 = 38.25
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 180,
          child: Stack(
            children: [
              // Imagem de fundo (assets)
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
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder:
                          (BuildContext context) {
                            return const AmorimetroPopUp();
                          },         
                    );
                  },
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
                          BorderRadius.circular(
                            5,
                          ),
                    ),
                    child: const Text(
                      "Ver amorímetro",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight:
                            FontWeight.bold,
                      ),
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
    );
  }
}

class AmorimetroPopUp extends StatelessWidget {
  const AmorimetroPopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: const Color(
              0xFFFDE7F3,
            ),
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
      titlePadding: EdgeInsetsGeometry.only(top: 0),
      children: [
       FutureBuilder<String>(
              future:
                  getUrl(), 
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const CircularProgressIndicator(); 
                } else if (snapshot.hasError) {
                  return Text(
                    'Erro: ${snapshot.error}',
                  );
                } else if (!snapshot.hasData) {
                  return const Text(
                    'Nenhuma imagem encontrada',
                  );
                } else {
                  // quando terminar, mostra a imagem
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