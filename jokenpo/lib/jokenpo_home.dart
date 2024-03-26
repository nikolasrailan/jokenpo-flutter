import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _imgApp = Image.asset('assets/images/padrao.png');
  String _mensagem = 'Escolha do App!';

  void _joga(String opcaoJogador) {
    final lista_opcao = ['pedra', 'papel', 'tesoura'];
    final opcaoApp = lista_opcao[Random().nextInt(3)];

    setState(() {
      _imgApp = Image.asset('assets/images/$opcaoApp.png');
      _mensagem = _resultado(opcaoJogador, opcaoApp);
    });
  }

  String _resultado(String opcaoJogador, String opcaoApp) {
    String mensagem;

    if (opcaoJogador == 'pedra' && opcaoApp == 'papel' ||
        opcaoJogador == 'papel' && opcaoApp == 'tesoura' ||
        opcaoJogador == 'tesoura' && opcaoApp == 'pedra') {
      mensagem = 'Você Perdeu!!!';
    } else if (opcaoApp == opcaoJogador) {
      mensagem = 'Empate!!!';
    } else {
      mensagem = 'Você Venceu!!!';
    }

    return mensagem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textHome("Escolha do App"),
            SizedBox(
              height: 20,
            ),
            _imgApp,
            SizedBox(
              height: 20,
            ),
            textHome(_mensagem),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                choisePlayerDetector('pedra'),
                choisePlayerDetector('papel'),
                choisePlayerDetector('tesoura'),
              ],
            )
          ],
        ),
      ),
    );
  }

  GestureDetector choisePlayerDetector(String playerOp) {
    return GestureDetector(
        onTap: () => _joga(playerOp),
        child: Image.asset('assets/images/$playerOp.png', height: 100));
  }

  Text textHome(String text) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
    );
  }
}
