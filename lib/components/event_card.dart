import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String month;
  final String day;
  final String title;
  final String desc;
  final String images;
  final bool isEvento;
  final String endereco;
  final String time;
  final String data;

  const EventCard({
    super.key,
    required this.month,
    required this.day,
    required this.title,
    required this.desc,
    required this.images,
    required this.isEvento,
    required this.endereco,
    required this.time,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MoreInfoPopUp(
              img: images,
              title: title,
              desc: desc,
              isEvento: isEvento,
              endereco: endereco,
              horario: time,
              data: data,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 12,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(
                26,
              ), // 0.1 * 255 = 25.5
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // Coluna da data
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFEC2C8F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    month.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    day,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 14,
                    ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "$endereco, $time",
                      style: TextStyle(
                        color:
                            Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreInfoPopUp extends StatelessWidget {
  final String title;
  final String desc;
  final String img;
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
        "Mais sobre evento",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      titlePadding: const EdgeInsets.all(6),
      children: [
        ClipRect(
          child: Image.network(
            img,
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
              isEvento && endereco.isNotEmpty
                  ? Text(
                      '\n$endereco, $data - $horario',
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle:
                            FontStyle.italic,
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
