import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador; // Controlador para o TextField
  final String? rotulo; // Rótulo do campo
  final String? dica; // Dica do campo
  final IconData? icone; // Ícone do campo
  final TextInputType keyboardType; // Tipo de teclado

  // Construtor atualizado para aceitar o tipo de teclado
  Editor({
    this.controlador,
    this.rotulo,
    this.dica,
    this.icone,
    this.keyboardType = TextInputType.text, // Define como texto por padrão
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null, // Ícone do campo, se fornecido
          iconColor: Colors.green[900], // Cor do ícone
          labelText: rotulo, // Rótulo do campo
          hintText: dica, // Dica do campo
          hintStyle: TextStyle(fontSize: 24.0), // Estilo da dica
          labelStyle: TextStyle(fontSize: 24.0), // Estilo do rótulo
        ),
        keyboardType: keyboardType, // Tipo de teclado passado como parâmetro
      ),
    );
  }
}