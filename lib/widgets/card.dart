import 'package:myapp/domain/aderecos.dart'; 
import 'package:myapp/pages/detail_page.dart';
import 'package:flutter/material.dart';

class AssuntosCard extends StatefulWidget { 
  final Aderecos assuntosCard;

  const AssuntosCard({
    super.key,
    required this.assuntosCard,
  });

  @override
  State<AssuntosCard> createState() => _AssuntosCardState();
}

class _AssuntosCardState extends State<AssuntosCard> {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color:Colors.white,
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.assuntosCard.urlImage),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.assuntosCard.titulo,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(widget.assuntosCard.descricao),
                  const SizedBox(height: 4),
                  
                  const Text(
                    '2° Ano do Ensino Médio',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(
                assuntosCard: widget.assuntosCard,
              );
            },
          ),
        );
      },
    );
  }
}
