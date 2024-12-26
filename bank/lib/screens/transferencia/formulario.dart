import 'package:NeoBank/components/editor.dart'; // Importa o widget Editor personalizado.
import 'package:NeoBank/models/transferencia.dart'; // Importa o modelo Transferencia.
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material.

class FormularioTransferencia extends StatelessWidget {
  // Controladores para os campos de texto.
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência',
            style: TextStyle(color: Colors.white)), // Título da AppBar.
        backgroundColor: Colors.green[800], // Cor de fundo da AppBar.
      ),
      body: Column( // Removido o Padding
        children: <Widget>[
          // Campo "Número da Conta" com tipo de teclado número.
          Editor(
            controlador: _controladorCampoNumeroConta,
            rotulo: 'Número da Conta',
            dica: '0000',
            keyboardType: TextInputType.number, // Tipo de teclado número.
          ),
          // Campo "Valor" com tipo de teclado decimal e um ícone.
          Editor(
            controlador: _controladorCampoValor,
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
            keyboardType: TextInputType.numberWithOptions(decimal: true), // Permite valores decimais.
          ),
          ElevatedButton(
            child: Text('Confirmar'), // Texto do botão.
            onPressed: () {
              // Chama a função para criar uma transferência ao pressionar o botão.
              _criaTransferencia(context, _controladorCampoNumeroConta,
                  _controladorCampoValor);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Cor de fundo do botão.
              foregroundColor: Colors.black, // Cor do texto do botão.
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // Bordas arredondadas.
                side: BorderSide(
                  color: Colors.green, // Cor da borda do botão.
                  width: 2, // Largura da borda.
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Função para criar uma transferência.
void _criaTransferencia(BuildContext context, TextEditingController controladorCampoNumeroConta,
    TextEditingController controladorCampoValor) {
  // Tenta converter os textos dos controladores em números.
  final int? numeroConta = int.tryParse(controladorCampoNumeroConta.text);
  final double? valor = double.tryParse(controladorCampoValor.text);
  
  // Verifica se ambos os valores foram convertidos com sucesso.
  if (numeroConta != null && valor != null) {
    // Cria uma nova transferência com os valores fornecidos.
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('Criando Transferência'); // Exibe uma mensagem de debug.
    debugPrint('$transferenciaCriada'); // Exibe os detalhes da transferência.
    Navigator.pop(context, transferenciaCriada); // Retorna à tela anterior com a transferência criada.
  }
}