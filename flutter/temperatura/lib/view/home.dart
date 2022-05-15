import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController txtCelsius = TextEditingController();
  TextEditingController txtFahrenheit = TextEditingController();

  void calcularTemperatura() {
    setState(() {
      double c, f;
      
      c = double.parse(txtCelsius.text);
      
      f = (c * 9 / 5) * 32;
      
      txtFahrenheit.text = f.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff003366),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 80, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Conversor de Temperatura", style: TextStyle(color: Color(0xffffc801), fontWeight: FontWeight.bold, fontSize: 25)),
                Text("Converta de Celsius para Fahrenheit", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15)),
                SizedBox(height: 15),
                TextField(
                  controller: txtCelsius,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Temp. em Celsius",
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal
                  )
                ),
                SizedBox(height: 15),
                TextField(
                  readOnly: true,
                  controller: txtFahrenheit,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: "Temp. em Fahrenheit",
                  ),
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal
                  )
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    child: Text("Converter"),
                    onPressed: calcularTemperatura,
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff005cb9),
                      onPrimary: Colors.white
                    )
                  )
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    child: Text("Limpar"),
                    onPressed: (){
                      txtCelsius.clear();
                      txtFahrenheit.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      onPrimary: Colors.white
                    )
                  )
                )
              ]
            )
          )
        )
      )
    );
  }
}