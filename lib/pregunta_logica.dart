import 'package:quiz_app_sem5/pregunta.dart';

class PreguntaLogica {
  // el guien bajo (_preguntas) es para volver privada la lista solo se vera en este archivo
  List<Pregunta> _preguntas = [
    Pregunta(preguntaText: "El aprendio a programar?", respuesta: true),
    Pregunta(preguntaText: "titulado en la universidad?", respuesta: true),
    Pregunta(preguntaText: "Pagaste la luz?", respuesta: false),
    Pregunta(preguntaText: "tienes hambre?", respuesta: true),
  ];

  int _numeroPregunta = 0;

  String getPreguntaText() {
    return _preguntas[_numeroPregunta].preguntaText;
  }

  bool getRespuesta() {
    return _preguntas[_numeroPregunta].respuesta;
  }

  siguientePregunta() {
    if (_numeroPregunta < _preguntas.length - 1) {
      //si es menor a -1 para que termine la suma
      _numeroPregunta++;
    }
  }

  // validar final Pregunta
  bool validacion() {
    if (_numeroPregunta == _preguntas.length - 1) {
      return true;
    }
    return false;
  }

  //reiniciar preguntas
  void restar() {
    _numeroPregunta = 0;
  }
}
