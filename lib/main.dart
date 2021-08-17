//Importar libraries dos widgets para rodar o app
import 'package:flutter/material.dart';

void main() {
  //Comando para rodar o App
  //Função runApp(widget)
  //MaterialApp(Parâmetros Opcionais Construtor
  // );
  runApp(MaterialApp(
      title: "Contador de Pessoas", //Parametro opicional - title:
      //Passamos como parâmetro nosso Widget Stateful
      home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Variável para receber um numero inteiro
  int _people = 0;

  //Mudar o textinho
  String _infoText = "Pode Entrar!";

  //Pedir para o Flutter refazer a tela (somente aonde foi modificado) para atualizar o contador
  void _changePeople(int delta){
    setState(() {
      _people+=delta; //people = people + delta

      //Modificar texto de acordo com a quantidade de pessoas
      if(_people < 0){
        _infoText = "Número não permitido!";
      } else if (_people <10){
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //Primeiro widget que irá ficar embaixo
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover, //imagem cobrir a tela
          height: 1000.0,
        ),
        Column(
          //Alinhar todos os filhos ao centro
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Filhos da Coluna:

              //Primeiro Filho
              Text(
                "Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),

              //Segundo Filho
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    //Espaço
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text("-1",
                          style:
                          TextStyle(fontSize: 40.0, color: Colors.white)),
                      //Função que meu botão vai chamar sempre que eu apertar o botão
                      //Função anônima - (){}
                      onPressed: () {
                        //Chamada da função changePeople para decrementar o contador
                        _changePeople(-1);
                      },
                    ),
                  ),
                  Padding(
                    //Espaço
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text("+1",
                          style:
                          TextStyle(fontSize: 40.0, color: Colors.white)),
                      //Função que meu botão vai chamar sempre que eu apertar o botão
                      //Função anônima - (){}
                      onPressed: () {
                        //Chamada da função changePeople para decrementar o contador
                        _changePeople(1);
                      },
                    ),
                  ),
                ],
              ),

              //Terceiro Filho
              Text(
                _infoText,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0),
              )
            ])
      ],
    );
  }
}

