import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/domain/aderecos.dart';
import 'package:myapp/pages/plans.dart'; // Certifique-se de importar a PlansPage

class DetailPage extends StatefulWidget {
  final Aderecos assuntosCard;

  const DetailPage({super.key, required this.assuntosCard});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Aderecos get assuntos => widget.assuntosCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Image.network(assuntos.urlImage), 
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  assuntos.titulo,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                buildText(assuntos.descricao),
                const SizedBox(height: 8),
                Text(
                  'Conteúdo:',
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                buildText(assuntos.textoCompleto),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navegar para PlansPage ao clicar no botão
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Plans(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                  ),
                  child: const Text('Ir para os Planos'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildText(String text) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 14,
      ),
    );
  }
}