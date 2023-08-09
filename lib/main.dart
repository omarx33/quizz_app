import 'package:flutter/material.dart';
import 'package:quiz_app_sem5/pregunta_logica.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> puntosObtenidos = [];

  PreguntaLogica logicaDePregunta = PreguntaLogica();

  checkRespuesta(bool userRespuesta) {
    if (logicaDePregunta.validacion() == true) {
      //quiz finalizado
      // print("El quiz finalizo");
      Alert(
        context: context,
        type: AlertType.success,
        title: "QuizApp",
        desc: "El quiz finalizo",
        buttons: [
          DialogButton(
            child: Text(
              "Aceptar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      logicaDePregunta.restar();
      setState(() {});
      puntosObtenidos.clear();
    } else {
      // si la rpta de la pregunta 0 es = true
      bool rpstaCorrecta = logicaDePregunta.getRespuesta();

      if (rpstaCorrecta == userRespuesta) {
        puntosObtenidos.add(Icon(Icons.check, color: Colors.greenAccent));
      } else {
        puntosObtenidos.add(Icon(Icons.close, color: Colors.redAccent));
      }
      logicaDePregunta.siguientePregunta();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      appBar: AppBar(
        backgroundColor: Color(0xff2b2d42),
        title: Text("app"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  logicaDePregunta.getPreguntaText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkRespuesta(true);
                },
                child: Text(
                  "Verdadero",
                ),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkRespuesta(false);
                },
                child: Text(
                  "Falso",
                ),
                color: Colors.redAccent,
              ),
            ),
          ),
          Row(
            children: puntosObtenidos,
          )
        ],
      ),
    );
  }
}
