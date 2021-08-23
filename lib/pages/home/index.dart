import 'package:cauculadora/pages/home/botao.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.black,
      appBar: AppBar( 
        backgroundColor: Colors.black,
        ),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height / 3.1,
            width: MediaQuery.of(context).size.width,
            child: Text(text,
              maxLines: 2,
              textAlign: TextAlign.end,
              style: TextStyle(color: Colors.white,
              fontSize: 100
              ),
            ),
          ),
          
          Row(
            children: [
              Botao(cor: 0xFF757575, txt: 'AC', onClick: () => calculation('AC'),largura: 82,),
              Botao(cor: 0xFF757575, txt: '+/-',onClick: () => calculation('+/-'),largura: 82,),
              Botao(cor: 0xFF757575, txt: '%',onClick: () => calculation('%'),largura: 82,),
              Botao(cor: 0xFFFB8C00, txt: '/',onClick: () => calculation('/'),largura: 82,),
            ],
          ),
          Row(
            children: [
              Botao(cor: 0xFF303030, txt: '7',onClick: () => calculation('7'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '8',onClick: () => calculation('8'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '9',onClick: () => calculation('9'),largura: 82,),
              Botao(cor: 0xFFFB8C00, txt: '*',onClick: () => calculation('x'),largura: 82,),
            ],
          ),
          Row(
            children: [
              Botao(cor: 0xFF303030, txt: '4',onClick: () => calculation('4'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '5',onClick: () => calculation('5'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '6',onClick: () => calculation('6'),largura: 82,),
              Botao(cor: 0xFFFB8C00, txt: '-',onClick: () => calculation('-'),largura: 82,),
            ],
          ),
          Row(
            children: [
              Botao(cor: 0xFF303030, txt: '1',onClick: () =>  calculation('1'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '2',onClick: () => calculation('2'),largura: 82,),
              Botao(cor: 0xFF303030, txt: '3',onClick: () => calculation('3'),largura: 82,),
              Botao(cor: 0xFFFB8C00, txt: '+',onClick: () => calculation('+'),largura: 82,),
            ],
          ),
          Row(
            children: [
              Botao(cor: 0xFF303030, txt: '0',onClick: () => calculation('0'),largura: 179,),
              Botao(cor: 0xFF303030, txt: ',',onClick: () => calculation(','),largura: 82,),
              Botao(cor: 0xFFFB8C00, txt: '=',onClick: () => calculation('='),largura: 82,),
            ],
          ),
        ], 
      ),
    );
  }
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(txt) {


    if(txt  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && txt == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(txt == '+' || txt == '-' || txt == 'x' || txt == '/' || txt == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = txt;
      result = '';
    }
    else if(txt == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(txt == ',') {
      if(!result.toString().contains(',')) {
        result = result.toString()+',';
      }
      finalResult = result;
    }
    
    else if(txt == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + txt;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
         numOne = double.parse(result);           
         return doesContainDecimal(result);
  }

  String sub() {
         result = (numOne - numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
         numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
          numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains(',')) {
        List<String> splitDecimal = result.toString().split(',');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }
}