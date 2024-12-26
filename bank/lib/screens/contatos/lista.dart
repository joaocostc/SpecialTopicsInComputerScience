import 'package:NeoBank/models/contato.dart'; // Importa o modelo Contato.
import 'package:NeoBank/screens/contatos/formulario.dart'; // Importa a tela de formulário de contatos.
import 'package:flutter/material.dart'; // Importa o pacote Flutter Material.

class ListaContato extends StatefulWidget { // Classe que representa a lista de contatos.
  final List<Contato> _contatos = []; // Lista de contatos.

  @override
  State<StatefulWidget> createState() { // Cria o estado da lista de contatos.
    return ListaContatoState(); // Retorna uma nova instância do estado.
  }
}

class ListaContatoState extends State<ListaContato> { // Estado da ListaContato.
  @override
  Widget build(BuildContext context) { // Método para construir a interface.
    return Scaffold( // Cria a estrutura básica da tela.
      appBar: AppBar( // Cria a barra de aplicativo.
        title: Text('Lista de Contatos', style: TextStyle(color: Colors.white)), // Título da barra.
        backgroundColor: Colors.blue[900], // Cor da barra.
      ),
      body: ListView.builder( // Constrói uma lista de contatos.
        itemCount: widget._contatos.length, // Define a quantidade de itens na lista.
        itemBuilder: (context, indice) { // Constrói cada item da lista.
          final contato = widget._contatos[indice]; // Obtém o contato correspondente ao índice.
          return ItemContato(contato); // Retorna um widget que representa o contato.
        },
      ),
      floatingActionButton: FloatingActionButton( // Botão flutuante para adicionar contatos.
        child: Icon(Icons.add, color: Colors.white), // Ícone do botão.
        backgroundColor: Colors.blue[700], // Cor de fundo do botão.
        onPressed: () { // Ação ao pressionar o botão.
          final Future<Contato?> future = Navigator.push<Contato>(context, // Navega para a tela de formulário de contato.
              MaterialPageRoute(builder: (context) {
            return FormularioContato(); // Retorna a tela de formulário de contato.
          }));
          future.then((contatoCriado) { // Após retornar do formulário.
            if (contatoCriado != null) { // Verifica se um contato foi criado.
              setState(() { // Atualiza o estado da lista de contatos.
                widget._contatos.add(contatoCriado); // Adiciona o novo contato à lista.
              });
            }
          });
        },
      ),
    );
  }
}

class ItemContato extends StatelessWidget { // Classe que representa um item de contato.
  final Contato _contato; // Contato a ser exibido.
  const ItemContato(this._contato, {super.key}); // Construtor que recebe o contato.
  
  @override
  Widget build(BuildContext context) { // Método para construir a interface do item.
    return Card( // Cria um cartão para o item.
      child: ListTile( // Cria uma linha de lista para exibir o contato.
        leading: Icon(Icons.person, color: Colors.white), // Ícone do contato.
        title: Text('Nome: ${_contato.nome}'), // Nome do contato.
        subtitle: Column( // Exibe informações adicionais sobre o contato.
          crossAxisAlignment: CrossAxisAlignment.start, // Alinha as informações à esquerda.
          children: [
            Text('Endereço: ${_contato.endereco}'), // Endereço do contato.
            Text('Telefone: ${_contato.numeroTelefone}'), // Telefone do contato.
            Text('Email: ${_contato.email}'), // Email do contato.
            Text('CPF: ${_contato.cpf}'), // CPF do contato.
          ],
        ),
      ),
    );
  }
}