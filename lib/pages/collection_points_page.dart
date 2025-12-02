import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:iam_app/components/myappbar.dart';
import 'package:iam_app/components/my_bottom_nav_bar.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:url_launcher/url_launcher.dart';

class CollectionPointsPage
    extends StatefulWidget {
  const CollectionPointsPage({super.key});

  @override
  State<CollectionPointsPage> createState() =>
      _CollectionPointsPageState();
}

class _CollectionPointsPageState
    extends State<CollectionPointsPage> {

  final List<GlobalKey> listinha = [
    GlobalKey(),
  ];

  @override
  void initState(){
ShowcaseView.register(
    );
    super.initState();
  }

  final _cepController = TextEditingController();
  final _numeroController =
      TextEditingController();

  List<dynamic> _pontosDeColeta = [];
  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        titleText: 'Pontos de Coleta',
        showcaseKeys: listinha,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Showcase(
              key: listinha[0],
              
              title: 'Barra de Busca',
              description:
                  'Insira seu CEP e número de estabelecimento para encontrar pontos de coleta próximos.',
                  descTextStyle: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                  ),
                 titleAlignment: AlignmentGeometry.topLeft,
                 toolTipSlideEndDistance: 0,
              child: SearchBar(
                cepController: _cepController,
                numeroController: _numeroController,
                onSearch: _fetchPontosDeColeta,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(child: _buildResults()),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(
        currentIndex: 0,
      ),
    );
  }

  Future<void> _fetchPontosDeColeta() async {
    // Esconde o teclado
    FocusScope.of(context).unfocus();

    if (_cepController.text.isEmpty) {
      setState(() {
        _errorMessage =
            "Por favor, insira um CEP para realizar a busca.";
        _pontosDeColeta = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final url = Uri.https(
        'hair4hope-backend.onrender.com',
        '/ponto/pesquisa',
        {
          'cep': _cepController.text,
          'numero': _numeroController.text,
        },
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          _pontosDeColeta = jsonDecode(
            response.body,
          );
          if (_pontosDeColeta.isEmpty) {
            _errorMessage =
                "Nenhum ponto de coleta encontrado para este endereço.";
          }
        });
      } else {
        throw Exception(
          'Falha ao carregar dados. Status: ${response.statusCode}',
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage =
            "Ocorreu um erro ao buscar os dados. Tente novamente.";
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildResults() {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFEC2C8F),
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Text(
          _errorMessage!,
          textAlign: TextAlign.center,
        ),
      );
    }

    if (_pontosDeColeta.isEmpty) {
      return const Center(
        child: Text(
          "Insira um CEP e número para encontrar pontos de doação próximos.",
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView.builder(
      itemCount: _pontosDeColeta.length,
      itemBuilder: (context, index) {
        final ponto = _pontosDeColeta[index];
        final distanciaKm = (ponto['dist'] as num)
            .toStringAsFixed(2);
        return OngCard(
          title:
              ponto['nome'] ??
              'Nome não informado',
          subtitle:
              ponto['endereco'] ??
              'Endereço não informado',
          distance: "$distanciaKm km",
          mapsUrl: ponto['maps'] ?? '',
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController cepController;
  final TextEditingController numeroController;
  final VoidCallback onSearch;

  const SearchBar({
    super.key,
    required this.cepController,
    required this.numeroController,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
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
      child: Row(
        children: [
          Expanded(
            flex: 3, // Ocupa 3/4 do espaço
            child: TextField(
              controller: cepController,
              onSubmitted: (_) => onSearch(),
              keyboardType:
                  TextInputType.numberWithOptions(
                    decimal: false,
                  ),
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly,
              ],
              decoration: InputDecoration(
                hintText: 'Insira seu CEP',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12.0,
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 16.0,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 1, // Ocupa 1/4 do espaço
            child: TextField(
              controller: numeroController,
              onSubmitted: (_) => onSearch(),
              keyboardType:
                  TextInputType.numberWithOptions(
                    decimal: false,
                  ),
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly,
              ], // Teclado numérico
              decoration: InputDecoration(
                hintText: 'N°',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 12.0,
                ),
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 10.0,
                    ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade600,
            ),
            onPressed: onSearch,
          ),
        ],
      ),
    );
  }
}

class OngCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String distance;
  final String mapsUrl;

  const OngCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.distance,
    required this.mapsUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow:
                        TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '~$distance',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFFEC2C8F),
                  ),
                ),
              ],
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            TextButton(
              onPressed: () async {
                if (mapsUrl.isNotEmpty) {
                  final Uri url = Uri.parse(
                    mapsUrl,
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(
                  0xFFEC2C8F,
                ),
              ),
              child: const Text("Como chegar"),
            ),
          ],
        ),
      ),
    );
  }
}
