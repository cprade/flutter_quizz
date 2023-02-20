import 'package:flutter/material.dart';
import 'datas.dart';

class Quizz extends StatefulWidget {
  const Quizz({super.key});

  @override
  QuizzState createState() => QuizzState();
}

class QuizzState extends State<Quizz> {
  var i = 0;
  var score = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (i < Datas().listeQuestions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Votre score: $score"),
        ),
        body: Container(
          alignment: Alignment.center,
          height: size.height,
          child: Column(
            children: [
              const SizedBox(width: 15, height: 15),
              Text(
                "Question numéro: ${i + 1}/10",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 50, height: 50),
              myQuestions(i),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (Datas().listeQuestions[i].reponse == true) {
                          setState(() {
                            showMyDialog(dialog: popupGood());
                          });
                        } else {
                          showMyDialog(dialog: popupBad());
                        }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.lightGreen)),
                      child: const Text("VRAI")),
                  ElevatedButton(
                    onPressed: () {
                      if (Datas().listeQuestions[i].reponse == false) {
                        setState(() {
                          showMyDialog(dialog: popupGood());
                        });
                      } else {
                        showMyDialog(dialog: popupBad());
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.redAccent)),
                    child: const Text("FAUX"),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Votre score est de $score"),
        ),
        body: Container(
          alignment: Alignment.center,
          height: size.height,
          child: finalPopup(),
        ),
      );
    }
  }

  myQuestions(i) {
    return Column(
      children: [
        Text(
          Datas().listeQuestions[i].question,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(width: 20, height: 20),
        Image.asset(Datas().listeQuestions[i].getImage()),
        const SizedBox(width: 20, height: 20),
      ],
    );
  }

  Future<void> showMyDialog({required Widget dialog}) async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) {
          return dialog;
        });
  }

  popupGood() {
    return SimpleDialog(
      title: const Text("Bonne réponse !"),
      elevation: 10,
      children: [
        const SizedBox(width: 7, height: 7),
        Image.asset("images/pexels-good.jpg"),
        const SizedBox(width: 7, height: 7),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                i++;
                score++;
              });
            },
            child: const Text("Passer à la question suivante")),
      ],
    );
  }

  popupBad() {
    var explicationFalse = Datas().listeQuestions[i].explication;
    return SimpleDialog(
      title: const Text("Mauvaise réponse !"),
      elevation: 10,
      children: [
        const SizedBox(width: 10, height: 10),
        Text(explicationFalse),
        const SizedBox(width: 10, height: 10),
        Image.asset("images/pexels-bad.jpg"),
        const SizedBox(width: 10, height: 10),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                i++;
              });
            },
            child: const Text("Passer à la question suivante")),
      ],
    );
  }

  finalPopup() {
    return SimpleDialog(
      title: Text("Score final: $score"),
      elevation: 10,
      children: [
        const SizedBox(width: 10, height: 10),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Retourner au menu principal")),
      ],
    );
  }
}
