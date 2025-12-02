import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:showcaseview/showcaseview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Carrosel extends StatefulWidget {
  const Carrosel({super.key});

  @override
  State<Carrosel> createState() => _CarroselState();
}

class _CarroselState extends State<Carrosel> {
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
                width: 300,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Aprenda a \ndoar mechas!!",
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
                width: 300,
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
                "assets/images/carrosel3.png",
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
                width: 250,
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Quer receber um Kit?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Esta passando por tratamento e\n"
                      "quer receber ajuda? Clique aqui e entenda como!",
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
      child:  CarouselView.weighted(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          flexWeights: [1, 8, 1],
          itemSnapping: true,
          scrollDirection: Axis.horizontal,
          controller: controller,
          onTap: (index) {
            switch (index) {
              case 0:
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LearnHowDonatePopUp();
                  },
                );
              case 1:
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AmorimetroPopUp();
                  },
                );
              case 2:
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const GetHelpPopUp();
                  },
                );
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

class LearnHowDonatePopUp
    extends StatelessWidget {
  const LearnHowDonatePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> carouselitens = [
      Image.asset("assets/images/comodoar.png"),
      Image.asset("assets/images/comodoar2.webp"),
    ];

    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: const Text(
        'Informações de como doar',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      titlePadding: EdgeInsetsGeometry.only(
        top: 0,
      ),
      children: [
        SizedBox(
          height: 180,
          width: double.maxFinite,
          child: CarouselView.weighted(
            itemSnapping: true,
            flexWeights: [8],
            children: carouselitens,
          ),
        ),
      ],
    );
  }
}

class GetHelpPopUp extends StatefulWidget {
  const GetHelpPopUp({super.key});

  @override
  State<GetHelpPopUp> createState() =>
      _GetHelpPopUpState();
}

class _GetHelpPopUpState
    extends State<GetHelpPopUp> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setBackgroundColor(
        const Color(0x00000000),
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onNavigationRequest:
              (NavigationRequest request) {
                final isFormulario =
                    request.url.contains(
                      'forms',
                    ) ||
                    request.url.contains(
                      'google.com',
                    ) ||
                    request.url.contains(
                      'typeform',
                    );

                if (isFormulario) {
                  launchUrl(
                    Uri.parse(request.url),
                    mode: LaunchMode
                        .externalApplication,
                  );
                  return NavigationDecision
                      .prevent;
                }
                return NavigationDecision
                    .navigate;
              },
        ),
      )
      // 2. Carrega a URL solicitada
      ..loadRequest(
        Uri.parse(
          'https://amoremmechas.com/quero-uma-peruca',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      title: const Text(
        'Como receber ajuda',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: const EdgeInsets.all(
        0,
      ), // Remove padding padrão para aproveitar espaço
      titlePadding: const EdgeInsets.fromLTRB(
        24,
        24,
        24,
        10,
      ),
      children: [
        // 3. O WebView PRECISA de altura definida dentro de um Dialog
        SizedBox(
          height:
              400, // Altura da janela do navegador
          width: double
              .maxFinite, // Largura máxima do dialog
          child: Stack(
            children: [
              // O Widget do WebView
              WebViewWidget(
                controller: _controller,
              ),

              // O Loading que aparece por cima
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors
                        .pink, // Mude para a cor do seu app
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
