import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final int cor;
  final String txt;
  final Function onClick;
  final double largura;
  
  Botao({ Key? key, required this.cor, required this.txt, required this.onClick, required this.largura}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.zero,
            child: TextButton(
              onPressed: () => onClick(),
              child: Container(
              height:82,
              width: largura,
              decoration: BoxDecoration(
                color: Color(cor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child:(Text(txt,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ))
                ),
              ),
            ),),
          );
  }
}