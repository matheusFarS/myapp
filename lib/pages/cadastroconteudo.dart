import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CadastroConteudo extends StatefulWidget {
  const CadastroConteudo({super.key});

  @override
  State<CadastroConteudo> createState() => _CadastroConteudoState();
}

class _CadastroConteudoState extends State<CadastroConteudo> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController urlImageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Column(
            children: [
              const SizedBox(height: 200),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(70.0),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        const Center(
                          child: Text(
                            'Cadastro de Conteúdo',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: tituloController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Título é obrigatório.";
                              }
                              return null;
                            },
                            decoration: buildInputDecoration('Título'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: descricaoController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Descrição é obrigatória.";
                              }
                              return null;
                            },
                            decoration: buildInputDecoration('Descrição'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: urlImageController,
                            validator: (value) {
                              if (value!.isEmpty || !Uri.parse(value).isAbsolute) {
                                return "URL da imagem é inválido.";
                              }
                              return null;
                            },
                            decoration: buildInputDecoration('URL da Imagem'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String titulo = tituloController.text;
                                String descricao = descricaoController.text;
                                String urlImage = urlImageController.text;

                                // Implementar lógica para salvar os dados
                                print('Título: $titulo');
                                print('Descrição: $descricao');
                                print('URL da Imagem: $urlImage');

                                // Navegar ou exibir confirmação
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Conteúdo cadastrado com sucesso!'),
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Cadastrar',
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: const Color(0xFFF0F0F0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
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
}
