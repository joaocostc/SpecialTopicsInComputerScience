import 'package:NeoBank/components/editor.dart'; // Importa o componente Editor.
import 'package:NeoBank/models/contato.dart'; // Importa o modelo de Contato.
import 'package:flutter/material.dart'; // Importa o pacote Flutter.

class FormularioContato extends StatelessWidget {
  final TextEditingController _controladorCampoNome = TextEditingController(); // Controlador para o campo de nome.
  final TextEditingController _controladorCampoEndereco = TextEditingController(); // Controlador para o campo de endereço.
  final TextEditingController _controladorCampoNumeroTelefone = TextEditingController(); // Controlador para o campo de telefone.
  final TextEditingController _controladorCampoEmail = TextEditingController(); // Controlador para o campo de email.
  final TextEditingController _controladorCampoCpf = TextEditingController(); // Controlador para o campo de CPF.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Clientes', style: TextStyle(color: Colors.white)), // Título da AppBar.
        backgroundColor: Colors.blue[900], // Cor da AppBar.
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: _controladorCampoNome, // Campo para nome.
            rotulo: 'Nome', // Rótulo que descreve o campo de nome.
            dica: 'Exemplo: José da Silva', // Dica exibida dentro do campo.
            keyboardType: TextInputType.text, // Define teclado de texto.
          ),
          Editor(
            controlador: _controladorCampoEndereco, // Campo para endereço.
            rotulo: 'Endereço', // Rótulo que descreve o campo de endereço.
            dica: 'Exemplo: Rua da Silva, 1234', // Dica exibida dentro do campo.
            keyboardType: TextInputType.text, // Define teclado de texto.
          ),
          Editor(
            controlador: _controladorCampoNumeroTelefone, // Campo para telefone.
            rotulo: 'Telefone', // Rótulo que descreve o campo de telefone.
            dica: 'Exemplo: (77)77777-7777', // Dica exibida dentro do campo.
            keyboardType: TextInputType.phone, // Define teclado numérico para telefone.
          ),
          Editor(
            controlador: _controladorCampoEmail, // Campo para email.
            rotulo: 'Email', // Rótulo que descreve o campo de email.
            dica: 'Exemplo: josedasilva@gmail.com', // Dica exibida dentro do campo.
            keyboardType: TextInputType.emailAddress, // Define teclado de email.
          ),
          Editor(
            controlador: _controladorCampoCpf, // Campo para CPF.
            rotulo: 'CPF', // Rótulo que descreve o campo de CPF.
            dica: 'Exemplo: 777.777.777-77', // Dica exibida dentro do campo.
            keyboardType: TextInputType.number, // Define teclado numérico para CPF.
          ),
          ElevatedButton(
            child: Text('Confirmar'), // Texto do botão.
            onPressed: () {
              _criaContato(context, _controladorCampoNome, _controladorCampoEndereco, _controladorCampoNumeroTelefone, _controladorCampoEmail, _controladorCampoCpf); // Chama a função para criar o contato.
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Cor de fundo do botão.
              foregroundColor: Colors.white, // Cor do texto do botão.
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4), // Bordas arredondadas.
                side: BorderSide(
                  color: Colors.blueAccent, // Cor da borda do botão.
                  width: 2, // Largura da borda.
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0), // Definindo padding personalizado.
            ),
          ),
        ],
      ),
    );
  }
}

// Função para criar um contato.
void _criaContato(BuildContext context, TextEditingController controladorCampoNome,
    TextEditingController controladorCampoEndereco, TextEditingController controladorCampoNumeroTelefone,
    TextEditingController controladorCampoEmail, TextEditingController controladorCampoCpf) {
  
  final String? nome = controladorCampoNome.text; // Obtém o nome.
  final String? endereco = controladorCampoEndereco.text; // Obtém o endereço.
  final String? telefone = controladorCampoNumeroTelefone.text; // Obtém o telefone.
  final String? email = controladorCampoEmail.text; // Obtém o email.
  final String? cpf = controladorCampoCpf.text; // Obtém o CPF.

  // Verifica se todos os campos foram preenchidos.
  if (nome != null && endereco != null && telefone != null && email != null && cpf != null) {
    final contatoCriado = Contato(nome, endereco, telefone, email, cpf); // Cria uma nova instância de Contato.
    debugPrint('Criando Contato'); // Imprime mensagem de depuração.
    debugPrint('$contatoCriado'); // Imprime o contato criado.
    Navigator.pop(context, contatoCriado); // Retorna o contato criado para a tela anterior.
  }
}
