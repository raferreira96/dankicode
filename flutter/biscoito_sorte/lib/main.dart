import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var listaFrases = [
    "Não faça aos outros o que não quer que façam a você.",
    "Não se pode pisar duas vezes no mesmo rio.",
    "A vida é um processo constante de morrer.",
    "Ser é ser percebido.",
    "A vida trará coisas boas se tiver paciência.",
    "Não compense na ira o que lhe falta na razão.",
    "Defeitos e virtudes são apenas dois lados da mesma moeda.",
    "A maior de todas as torres começa no solo.",
    "Não há que ser forte, há que ser flexível.",
    "Siga os bons e aprenda com eles.",
    "Não importa o tamanho da montanha, ela não pode tapar o sol",
    "Lamentar aquilo que não temos é desperdiçar aquilo que já possuímos.",
    "Sem o fogo do entusiasmo, não há o calor da vitória.",
    "O riso é a menor distância entre duas pessoas.",
    "A sorte favorece a mente bem preparada.",
    "Todas as coisas são difíceis antes de se tornarem fáceis.",
    "Você é do tamanho do seu sonho.",
    "Nós somos oque pensamos.",
    "A maior barreira para o sucesso é o medo do fracasso.",
    "Coragem é a resistência ao medo, domínio do medo, e não a ausência do medo.",
    "Acredite em milagres, mas não dependa deles.",
    "Realize o óbvio, pense no improvável e conquiste o impossível.",
    "Você sempre será a sua melhor companhia!",
    "A inspiração vem dos outros. A motivação vem de dentro de nós.",
    "Não acredite mais em pessoas especiais, mas em momentos especiais com pessoas normais."
  ];

  var imgBiscoito= "assets/img/biscoito_inteiro.jpg";

  var fraseSorte = "Clique no botão para quebrar o biscoito!";

  void quebrarBiscoito() {
    var numero = Random().nextInt(listaFrases.length);

    setState(() {
      fraseSorte = listaFrases[numero];

      imgBiscoito = "assets/img/biscoito_quebrado.jpg";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Biscoito da Sorte"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(80),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imgBiscoito),
                radius: 80,
                backgroundColor: Colors.white
              ),
              Text(fraseSorte, textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontFamily: 'Pacifico')),
              ElevatedButton(
                child: Text("QUEBRAR BISCOITO!"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white
                ),
                onPressed: quebrarBiscoito
              )
            ]
          )
        )
      )
    );
  }
}