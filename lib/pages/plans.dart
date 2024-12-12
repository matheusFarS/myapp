import 'package:flutter/material.dart';
import 'package:myapp/bd/database2.dart';


class Plans extends StatefulWidget {
  const Plans({super.key});


  @override
  State<Plans> createState() => _PlansState();
}


class _PlansState extends State<Plans> {
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
       
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 150),
                Container(
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
                      const Center(
                        child: Text(
                          'Planejamento',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Center(
                        child: Text(
                          'Matemática',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: Database2.assuntos.length,
                        itemBuilder: (context, i) {
                          final planejamento = Database2.assuntos[i];
                          return Card(
                            margin: EdgeInsets.all(8.0),
                            child: ExpansionTile(
                              title: Text(
                                planejamento.titulo,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                'Data:' + planejamento.data,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Formato:',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(planejamento.formato),
                                      SizedBox(height: 8.0),
                                      Text(
                                        'Conteúdo:',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(planejamento.conteudo),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}