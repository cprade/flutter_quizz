import 'package:flutter/material.dart';
import 'package:flutter_quizz/quizz.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  PrincipalState createState() => PrincipalState();
}

class PrincipalState extends State<Principal> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Quizz"),
      ),
      body: Container(
        alignment: Alignment.center,
        height: size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                color: const Color.fromRGBO(255, 228, 225, 1),
                child: Column(
                  children: [
                    Image.asset(
                      "images/pexels-pix.jpg",
                    ),
                    const SizedBox(width: 15, height: 15),
                    ElevatedButton(
                        onPressed: () {
                          final quizz = Quizz();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext ctx) {
                            return quizz;
                          }));
                        },
                        child: const Text("Commencer le quizz"))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
