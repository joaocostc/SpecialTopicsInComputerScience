class Contato {
  final String nome;
  final String endereco;
  final String numeroTelefone;
  final String email;
  final String cpf;
  Contato(this.nome, this.endereco, this.numeroTelefone, this.email, this.cpf);
  @override
  String toString() {
    return 'Transferencia{Nome: $nome, Endereço: $endereco, Telefone: $numeroTelefone, Email: $email, CPF: $cpf}';
  }
}
