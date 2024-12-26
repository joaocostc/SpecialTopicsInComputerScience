import 'package:NeoBank/models/transferencia.dart'; // Importa o modelo de Transferência.
import 'package:NeoBank/screens/transferencia/formulario.dart'; // Importa o formulário de Transferência.
import 'package:flutter/material.dart'; // Importa o pacote Flutter.
import 'package:intl/intl.dart'; // Importa o intl para formatação de moeda.

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = []; // Lista de transferências.
  
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState(); // Retorna o estado da lista de transferências.
  }
}

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências', style: TextStyle(color: Colors.white)), // Título da AppBar.
        backgroundColor: Colors.green[800], // Cor da AppBar.
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length, // Conta o número de transferências.
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice]; // Obtém a transferência atual.
          return ItemTransferencia(transferencia); // Retorna um ItemTransferencia.
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white), // Ícone do botão flutuante.
        backgroundColor: Colors.blue[700], // Cor de fundo do botão.
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push<Transferencia>( // Navega para o formulário de transferência.
              context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia(); // Retorna a tela de formulário.
          }));
          future.then((transferenciaRecebida) { // Quando o formulário é enviado.
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(transferenciaRecebida); // Adiciona a nova transferência à lista.
              });
            }
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia; // Instância da transferência.
  const ItemTransferencia(this._transferencia, {super.key}); // Construtor da classe.

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$'); // Formata o valor como moeda (real).
    final String valorFormatado = formatter.format(_transferencia.valor); // Valor formatado.
    
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on, color: Colors.green[900]), // Ícone do item.
        title: Text(valorFormatado), // Exibe o valor formatado.
        subtitle: Text(_transferencia.numeroConta.toString()), // Exibe o número da conta.
      ),
    );
  }
}