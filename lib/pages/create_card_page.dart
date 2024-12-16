import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/bd/card_dao.dart';
import 'package:myapp/domain/aderecos.dart';
import 'package:myapp/pages/home_page.dart'; 

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({super.key});

  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  TextEditingController urlImageController = TextEditingController();
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController textoCompletoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
        
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 150),
                  
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        topLeft: Radius.circular(50.0),
                      ),
                    ),
                    
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          'Cadastrar Novo Card',
                          style: GoogleFonts.montserrat(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                        
                        buildTextFormField(
                          controller: urlImageController,
                          text: 'Url da Imagem',
                        ),
                        buildTextFormField(
                          controller: tituloController,
                          text: 'Título',
                        ),
                        buildTextFormField(
                          controller: descricaoController,
                          text: 'Descrição',
                        ),
                        buildTextFormField(
                          controller: textoCompletoController,
                          text: 'Texto Completo',
                        ),
                        const SizedBox(height: 8),
                        
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onPressed: onPressed,
                          child: const Text(
                            'Cadastrar Card',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextFormField({
    required TextEditingController controller,
    required String text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: fieldValidator,
        decoration: buildInputDecoration(text),
        cursorColor: const Color(0xFF10397B),
      ),
    );
  }

  String? fieldValidator(value) {
    if (value == null || value.isEmpty) {
      return "Este campo não pode ser vazio!";
    } else {
      return null;
    }
  }

  buildInputDecoration(String name) {
    return InputDecoration(
      label: Text(name),
      floatingLabelStyle: GoogleFonts.montserrat(
        color: const Color(0xFF10397B),
        fontWeight: FontWeight.w600,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          width: 2,
          color: Color(0xFF10397B),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    String urlImage = urlImageController.text;
    String titulo = tituloController.text;
    String descricao = descricaoController.text;
    String textoCompleto = textoCompletoController.text;

    Aderecos adereco = Aderecos(
      id: 0,
      urlImage: urlImage,
      titulo: titulo,
      descricao: descricao,
      textoCompleto: textoCompleto,
    );

    await AderecosDao().salvarAdereco(adereco);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }
}
