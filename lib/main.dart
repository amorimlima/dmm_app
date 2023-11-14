import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste de Personalidade',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/personalidade': (context) => PersonalidadePage(),
        // Adicione mais rotas conforme necessário
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Adicione sua logo aqui
            Image.asset(
              'caminho/para/sua/logo.png',
              width: 150.0, // ajuste conforme necessário
              height: 150.0, // ajuste conforme necessário
            ),
            SizedBox(height: 20.0), // Espaço entre a logo e o botão
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/personalidade');
              },
              child: Text('Iniciar'),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonalidadePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste de Personalidade'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina1');
              },
              child: Text('Página 1'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina2');
              },
              child: Text('Página 2'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/pagina3');
              },
              child: Text('Página 3'),
            ),
          ],
        ),
      ),
    );
  }
}
