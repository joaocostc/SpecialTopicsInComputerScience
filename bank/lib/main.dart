import 'package:NeoBank/screens/dashboard/dashboard.dart'; // Importa a tela do Dashboard.
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material.

void main() => runApp(BankApp()); // Função principal que inicia o aplicativo.

class BankApp extends StatelessWidget { // Classe principal do aplicativo.
  @override
  Widget build(BuildContext context) { // Método para construir a interface do aplicativo.
    return MaterialApp( // Cria um widget MaterialApp.
      theme: ThemeData.dark(), // Define o tema do aplicativo como escuro.
      home: Dashboard(), // Define a tela inicial do aplicativo como Dashboard.
    );
  }
}
