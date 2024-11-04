import 'package:flutter/material.dart';
import 'package:myapp/bd/database.dart';
import 'package:myapp/widgets/card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          'Assuntos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      const Center(
                        child: Text(
                          'História',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
    
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true, 
                        itemCount: Database.assuntos.length,
                        itemBuilder: (context, i) {
                          return AssuntosCard(
                            assuntosCard: Database.assuntos[i],
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
