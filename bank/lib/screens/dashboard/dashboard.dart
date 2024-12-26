import 'package:flutter/material.dart'; // Importa o pacote Flutter para utilizar widgets e temas.
import 'package:NeoBank/screens/contatos/lista.dart'; // Importa a tela de contatos.
import 'package:NeoBank/screens/transferencia/lista.dart'; // Importa a tela de transferências.

class Dashboard extends StatelessWidget { // Define a classe Dashboard como um widget sem estado.
  const Dashboard({super.key}); // Construtor que permite a passagem de uma chave.

  @override
  Widget build(BuildContext context) { // Método build que constrói a interface do usuário.
    return Scaffold( // Scaffold é um layout básico para um aplicativo Material Design.
      appBar: AppBar( // Barra de aplicativo no topo da tela.
        title: Text('Dashboard', style: TextStyle(color: Colors.white)), // Título da barra de aplicativo com texto branco.
        backgroundColor: Colors.purple[900], // Define a cor de fundo da AppBar.
      ),
      body: Column( // Coluna que empilha os elementos verticalmente.
        children: [
          SizedBox(height: 8), // Espaçamento superior para a coluna.
          _buildDashboardCard( // Chamada para criar o card de contatos.
            context,
            'Contatos', // Rótulo do card.
            Icons.people, // Ícone do card.
            Colors.blue, // Cor de fundo do card.
            ListaContato(), // Widget de destino ao clicar no card.
          ),
          SizedBox(height: 16), // Espaçamento entre os cards.
          _buildDashboardCard( // Chamada para criar o card de transferências.
            context,
            'Transferências', // Rótulo do card.
            Icons.monetization_on, // Ícone do card.
            Colors.green, // Cor de fundo do card.
            ListaTransferencia(), // Widget de destino ao clicar no card.
          ),
        ],
      ),
    );
  }

  // Função para criar os cards reutilizáveis
  Widget _buildDashboardCard(BuildContext context, String label, IconData icon,
      Color color, Widget destination) {
    return GestureDetector( // Permite detectar toques no card.
      onTap: () { // Ação ao tocar no card.
        Navigator.push( // Navega para a nova tela.
          context,
          MaterialPageRoute(builder: (context) => destination), // Cria a rota para a tela de destino.
        );
      },
      child: Align( // Alinha o card à esquerda.
        alignment: Alignment.centerLeft,
        child: Container( // Contêiner para o card.
          margin: EdgeInsets.only(left: 8.0), // Margem à esquerda do card.
          width: 200, // Largura do card.
          height: 150, // Altura do card.
          child: Card( // Widget Card que contém o conteúdo visual.
            color: color, // Cor de fundo do card.
            shape: RoundedRectangleBorder( // Forma do card (sem bordas arredondadas).
              borderRadius: BorderRadius.circular(0),
            ),
            child: Stack( // Permite sobrepor widgets dentro do card.
              children: [
                Positioned( // Posiciona o ícone dentro do card.
                  top: 10.0,
                  left: 10.0,
                  child: Icon(icon, color: Colors.black), // Ícone preto.
                ),
                Align( // Alinha o texto na parte inferior esquerda do card.
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0, left: 10.0), // Preenchimento do texto.
                    child: Text(
                      label, // Texto do card.
                      style: TextStyle(color: Colors.black), // Estilo do texto (preto).
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
