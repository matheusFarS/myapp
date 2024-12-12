import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/pages/home_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

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
                            'Login',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black, 
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Registre-se para continuar',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black, 
                          ),
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: 300, 
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.contains("@")) {
                                return null;
                              } else {
                                return "E-mail inválido.";
                              }
                            },
                            decoration: buildInputDecoration('E-mail'),
                            cursorColor: const Color(0xFF10397B),
                          ),
                        ),

                        const SizedBox(height: 20),

                        SizedBox(
                          width: 300, 
                          child: TextFormField(
                            obscureText: true,
                            controller: senhaController,
                            validator: (value) {
                              if (value!.length >= 7) {
                                return null;
                              } else {
                                return "Senha inválida.";
                              }
                            },
                            decoration: buildInputDecoration('Senha'),
                            cursorColor: const Color(0xFF10397B),
                          ),
                        ),
                        const SizedBox(height: 20),

                        SizedBox(
                          width: 300, 
                          child: ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                String email = emailController.text;
                                String senha = senhaController.text;

                                if (email == 'heloa@gmail.com' &&
                                    senha == '123456789') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ),
                                  );
                                } else {
                              
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                              padding: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Entrar',
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
