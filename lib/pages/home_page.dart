import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iam_app/components/carrosel.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// import 'package:iam_app/components/donation_card.dart';
import 'package:iam_app/components/my_bottom_nav_bar.dart';
import 'package:iam_app/components/myappbar.dart';
import 'package:iam_app/components/event_card.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:iam_app/components/quick_access.dart';

class NextEvent {
  final String titulo;
  final String desc;
  final String endereco;
  final String horario;
  final String data;
  final bool isEvento;
  final List<String> images;

  NextEvent({
    required this.titulo,
    required this.desc,
    required this.endereco,
    required this.horario,
    required this.data,
    required this.isEvento,
    required this.images,
  });

  factory NextEvent.fromJson(
    Map<String, dynamic> json,
  ) {
    final imagesList = json['images'];
    final List<String> parsedImages =
        imagesList is List
        ? List<String>.from(
            imagesList.map(
              (item) => item.toString(),
            ),
          )
        : [];
    return NextEvent(
      titulo: json['titulo'] ?? '',
      desc: json['desc'] ?? '',
      endereco: json['endereco'] ?? '',
      horario: json['horario_evento'] ?? '',
      data: json['data_evento'] ?? '',
      isEvento: json['is_evento'] ?? false,
      images: parsedImages,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<NextEvent?>? _nextEventFuture;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
    _nextEventFuture = _fetchNextEvent();
  }

  Future<NextEvent?> _fetchNextEvent() async {
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
        final List<NextEvent> events = data
            .map(
              (json) => NextEvent.fromJson(json),
            )
            .where((item) => item.isEvento)
            .toList();

        if (events.isEmpty) {
          return null;
        }

        // Encontra o próximo evento futuro
        final now = DateTime.now();
        NextEvent? nextEvent;
        for (final event in events) {
          try {
            final eventDate = DateFormat(
              "dd/MM/yyyy",
            ).parse(event.data);
            if (eventDate.isAfter(now) ||
                eventDate.isAtSameMomentAs(now)) {
              if (nextEvent == null ||
                  eventDate.isBefore(
                    DateFormat(
                      "dd/MM/yyyy",
                    ).parse(nextEvent.data),
                  )) {
                nextEvent = event;
              }
            }
          } catch (e) {
            // Ignora eventos com data inválida
          }
        }
        return nextEvent;
      } else {
        throw Exception(
          'Falha ao carregar eventos: ${response.statusCode}',
        );
      }
    } catch (e) {
      debugPrint('Erro na API de eventos: $e');
      rethrow; // Permite que o FutureBuilder lide com o erro
    }
  }

  Widget _buildEventSection() {
    return FutureBuilder<NextEvent?>(
      future: _nextEventFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFEC2C8F),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Erro ao carregar evento.',
            ),
          );
        } else if (snapshot.hasData &&
            snapshot.data != null) {
          final event = snapshot.data!;
          final eventDate = DateFormat(
            "dd/MM/yyyy",
          ).parse(event.data);
          return EventCard(
            month: DateFormat(
              'MMM',
              'pt_BR',
            ).format(eventDate),
            day: DateFormat(
              'dd',
            ).format(eventDate),
            title: event.titulo,
            endereco: event.endereco,
            time: event.horario,
            desc: event.desc,
            images: event.images.isNotEmpty
                ? event.images.first
                : '',
            isEvento: event.isEvento,
            data: event.data,
          );
        } else {
          return const Center(
            child: Text('Nenhum evento próximo.'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        titleText: 'Início',
        showcaseKeys: [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: ListView(
          children: [
            const SizedBox(height: 5),
            Carrosel(),
            const SizedBox(height: 8),
            const QuickAcess(),
            const SizedBox(height: 25),
            const Text(
              'Próximo Evento',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildEventSection(),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}
