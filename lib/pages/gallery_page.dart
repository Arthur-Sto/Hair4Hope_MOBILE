import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:iam_app/components/my_bottom_nav_bar.dart';
import 'package:iam_app/components/myappbar.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() =>
      _GalleryPageState();
}

class _GalleryPageState
    extends State<GalleryPage> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: 'Galeria da Superação',
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Alinha os filhos à esquerda
          children: [
            ToggleAllOrEvent(
              isSelected: isSelected,
              onPressed: (index) {
                setState(() {
                  for (
                    int i = 0;
                    i < isSelected.length;
                    i++
                  ) {
                    isSelected[i] = i == index;
                  }
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: isSelected[0]
                  ? const GalleryGrid(
                      filterEvents: false,
                    )
                  : const GalleryGrid(
                      filterEvents: true,
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}

class GalleryItem {
  final String id;
  final String titulo;
  final String desc;
  final List<String> images;
  final bool isEvento;
  final String endereco;
  final String horario;
  final String data;

  GalleryItem({
    required this.id,
    required this.titulo,
    required this.desc,
    required this.images,
    required this.isEvento,
    required this.endereco,
    required this.horario,
    required this.data,
  });

  factory GalleryItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return GalleryItem(
      id: (json['_id'] ?? 0).toString(),
      titulo: json['titulo'] ?? '',
      desc: json['desc'] ?? '',
      images: List<String>.from(
        json['images'] ?? [],
      ),
      isEvento: json['is_evento'] ?? false,
      endereco: json['endereco'] ?? '',
      horario: json['horario_evento'] ?? '',
      data: json['data_evento'] ?? '',
    );
  }
}

// ---------------------------------------------------------------------------
// WIDGET DA GALERIA
// ---------------------------------------------------------------------------
class GalleryGrid extends StatefulWidget {
  final bool filterEvents;
  const GalleryGrid({
    super.key,
    required this.filterEvents,
  });

  @override
  State<GalleryGrid> createState() =>
      _GalleryGridState();
}

class _GalleryGridState
    extends State<GalleryGrid> {
  List<GalleryItem> _allItems = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchGalleryData();
  }

  Future<void> _fetchGalleryData() async {
    const String apiUrl =
        'https://hair4hope-backend.onrender.com/galeria/';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(
          response.body,
        );
        if (mounted) {
          setState(() {
            _allItems = data
                .map(
                  (json) =>
                      GalleryItem.fromJson(json),
                )
                .toList();
            _isLoading = false;
          });
        }
      } else {
        throw Exception(
          'Falha ao carregar: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Erro na API: $e');
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage =
              "Erro ao carregar a galeria.";
        });
      }
    }
  }

  Widget _buildImageCard(GalleryItem item) {
    final String imageUrl = item.images.isNotEmpty
        ? item.images.first
        : 'https://via.placeholder.com/300x400';

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MoreInfoPopUp(
              img: item.images,
              title: item.titulo,
              desc: item.desc,
              isEvento: item.isEvento,
              endereco: item.endereco,
              horario: item.horario,
              data: item.data,
            );
          },
        );
        // debugPrint('Clicou em: ${item.images}');
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
          loadingBuilder:
              (context, child, loadingProgress) {
                if (loadingProgress == null)
                  return child;
                return Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
          errorBuilder:
              (context, error, stackTrace) =>
                  Container(
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      color: Colors.grey,
                    ),
                  ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFEC2C8F),
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 48,
              color: Colors.red,
            ),
            const SizedBox(height: 10),
            Text(_errorMessage!),
            TextButton(
              onPressed: _fetchGalleryData,
              child: const Text(
                'Tentar novamente',
              ),
            ),
          ],
        ),
      );
    }

    final List<GalleryItem> displayedItems =
        widget.filterEvents
        ? _allItems
              .where((item) => item.isEvento)
              .toList()
        : _allItems;

    if (displayedItems.isEmpty) {
      return const Center(
        child: Text('Nenhum item encontrado.'),
      );
    }

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      itemCount: displayedItems.length,
      itemBuilder: (context, index) {
        final item = displayedItems[index];
        return _buildImageCard(item);
      },
    );
  }
}

class ToggleAllOrEvent extends StatefulWidget {
  final List<bool> isSelected;
  final void Function(int) onPressed;

  const ToggleAllOrEvent({
    super.key,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  State<ToggleAllOrEvent> createState() =>
      ToggleAllOrEventState();
}

class ToggleAllOrEventState
    extends State<ToggleAllOrEvent> {
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      constraints: const BoxConstraints(
        minHeight: 36.0,
      ),
      borderRadius: BorderRadius.circular(45),
      fillColor: const Color(0xFFEC2C8F),
      isSelected: widget.isSelected,
      selectedColor: Colors.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      onPressed: widget.onPressed,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text('Tudo'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text('Eventos'),
        ),
      ],
    );
  }
}

class MoreInfoPopUp extends StatelessWidget {
  final String title;
  final String desc;
  final List<String> img;
  final bool isEvento;
  final String endereco;
  final String horario;
  final String data;

  const MoreInfoPopUp({
    super.key,
    required this.img,
    required this.title,
    required this.desc,
    required this.isEvento,
    required this.endereco,
    required this.horario,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: EdgeInsets.zero,
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      title: const Text(
        "Galeria da Superação",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      titlePadding: const EdgeInsets.all(6),
      children: [
        ClipRect(
          child: Image.network(
            img[0],
            fit: BoxFit.cover,
          ),
        ),
        // Divider(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              isEvento
              ? Text(
                '\n$endereco, $data - $horario',
                style: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                ),
              )
              : const SizedBox.shrink(),
            ],
          ),
        ),
      ],
    );
  }
}
