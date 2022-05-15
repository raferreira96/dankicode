import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double taxa = 0;
  double totalConta = 0, totalPagar = 0, comissao = 0;
  int qtdPessoas = 0;

  TextEditingController txtTotal = TextEditingController();
  TextEditingController txtPessoas = TextEditingController();

  //Chave do Formulário
  final _formKey = GlobalKey<FormState>();

  void calcularRacha() {
    setState(() {
      totalConta = double.parse(txtTotal.text);
      qtdPessoas = int.parse(txtPessoas.text);
      
      comissao = (taxa * totalConta) / 100;
      
      totalPagar = (totalConta + comissao) / qtdPessoas;
      
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Total a Pagar por Pessoa"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/img/icon_smile.png", width: 60),
              Text("Total da Conta: R\$ $totalConta"),
              Text("Taxa do Garçom: R\$ $comissao"),
              Text("Total por Pessoa: R\$ $totalPagar")
            ]
          ),
          actions: [
            TextButton(
              child: Text("OK"),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Color(0xffFF6600),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Racha Conta"),
        centerTitle: true,
        backgroundColor: Color(0xffFF6600),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SvgPicture.asset("assets/img/icon_money.svg")
                  ),
                  TextFormField(
                    controller: txtTotal,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Total da Conta"
                    ),
                    style: TextStyle(fontSize: 18),
                    validator: (valor) {
                      if(valor!.isEmpty) return "Campo Obrigatório!";
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Taxa de Serviço %:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Slider(
                        value: taxa,
                        min: 0,
                        max: 10,
                        label: "$taxa %",
                        divisions: 10,
                        activeColor: Color(0xffFF6600),
                        inactiveColor: Colors.grey,
                        onChanged: (double valor) {
                          setState(() {
                            taxa = valor;
                          });
                        },
                      )
                    ]
                  ),
                  SizedBox(height: 15),
                  TextFormField(
                    controller: txtPessoas,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: "Qtd Pessoas"
                    ),
                    style: TextStyle(fontSize: 18),
                    validator: (valor) {
                      if(valor!.isEmpty) return "Campo Obrigatório!";
                      else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      child: Text("Calcular", style: TextStyle(fontSize: 20)),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffFF6600),
                        onPrimary: Colors.white
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()) {
                          calcularRacha();
                        }
                      }
                    ),
                  )
                ]
              ),
            ),
          )
        )
      )
    );
  }
}