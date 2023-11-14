import 'package:flutter/material.dart';

void main() => runApp(PersonalityTestApp());

class PersonalityTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz de Personalidade',
      home: PersonalityTestScreen(),
    );
  }
}

class PersonalityTestScreen extends StatefulWidget {
  @override
  _PersonalityTestScreenState createState() => _PersonalityTestScreenState();
}

class _PersonalityTestScreenState extends State<PersonalityTestScreen> {
  int questionIndex = 0;
  int score = 0;

  final List<Map<String, dynamic>> questions = [
    {
      'questionText': '1. Não gosto de dizer aos outros o que fazer.',
      'answers': [
        {'text': 'Concordo', 'score': 1},
        {'text': 'Discordo', 'score': 2},
      ],
    },
    // ... (outras perguntas aqui)
  ];

  void _answerQuestion(int answerScore) {
    setState(() {
      score += answerScore;
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else {
        // Todas as perguntas foram respondidas, mostrar o resultado
        _showResult();
      }
    });
  }

  void _showResult() {
    String resultText = '';
    if (score <= 10) {
      resultText = 'Você tem uma personalidade introvertida.';
    } else {
      resultText = 'Você tem uma personalidade extrovertida.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Resultado do Quiz de Personalidade'),
          content: Column(
            children: [
              Text(resultText),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Fechar o diálogo de resultado
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomeScreen(), // Navegar de volta para a tela inicial
                  ));
                },
                child: Text('Voltar para a tela inicial'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _goBack() {
    if (questionIndex > 0) {
      setState(() {
        questionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz de Personalidade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questions[questionIndex]['questionText'],
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...(questions[questionIndex]['answers'] as List<Map<String, dynamic>>)
                .map((answer) {
              return ElevatedButton(
                onPressed: () => _answerQuestion(answer['score']),
                child: Text(answer['text']),
              );
            }).toList(),
            if (questionIndex > 0) // Adicione o botão "Voltar" se não estiver na primeira pergunta
              ElevatedButton(
                onPressed: _goBack,
                child: Text('Voltar'),
              ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Inicial'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fechar a tela de resultado
          },
          child: Text('Iniciar o Quiz de Personalidade'),
        ),
      ),
    );
  }
}
