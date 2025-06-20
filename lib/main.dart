import 'blockchain.dart';

void main() {
  print('🚀 Iniciando Blockchain Simples em Dart com SHA-256 Real\n');

  // Cria uma nova blockchain com dificuldade 4
  final blockchain = Blockchain(difficulty: 4);

  print('✅ Blockchain criada com sucesso!');
  print('📊 Dificuldade de mineração: ${blockchain.difficulty}');
  print('🔗 Bloco Genesis criado automaticamente\n');

  // Adiciona algumas transações
  print('💰 Adicionando transações...');
  blockchain.addTransaction('Alice', 'Bob', 50.0);
  blockchain.addTransaction('Bob', 'Charlie', 25.0);
  blockchain.addTransaction('Charlie', 'David', 10.0);
  print('');

  // Adiciona um novo bloco (minera automaticamente)
  print('⛏️  Minerando novo bloco...');
  blockchain.addBlock();
  print('');

  // Adiciona mais transações
  print('💰 Adicionando mais transações...');
  blockchain.addTransaction('David', 'Eve', 5.0);
  blockchain.addTransaction('Eve', 'Frank', 15.0);
  print('');

  // Adiciona outro bloco
  print('⛏️  Minerando segundo bloco...');
  blockchain.addBlock();
  print('');

  // Exibe informações da blockchain
  blockchain.displayChain();

  // Demonstra validação da cadeia
  print('\n🔍 Verificando integridade da cadeia...');
  final isValid = blockchain.isChainValid();
  print('Resultado da validação: ${isValid ? "✅ Válida" : "❌ Inválida"}');

  // Demonstra tentativa de adulteração
  print('\n⚠️  Demonstração de adulteração...');
  if (blockchain.chain.length > 1) {
    final tamperedBlock = blockchain.chain[1];
    tamperedBlock.data = 'Dados adulterados!';
    print('Dados do bloco 1 foram alterados para: ${tamperedBlock.data}');

    print('🔍 Verificando integridade novamente...');
    final isValidAfterTampering = blockchain.isChainValid();
    print(
        'Resultado após adulteração: ${isValidAfterTampering ? "✅ Válida" : "❌ Inválida"}');
  }

  print('\n🎉 Demonstração concluída!');
  print('Este blockchain agora usa SHA-256 real e demonstra:');
  print('• Criação de blocos com hash SHA-256 real');
  print('• Mineração com proof-of-work usando hash criptográfico');
  print('• Validação de integridade da cadeia');
  print('• Detecção de adulteração');
  print('• Sistema de transações pendentes');

  print('\n🔐 Características de Segurança:');
  print('• Hash SHA-256 de 64 caracteres hexadecimais');
  print('• Impossibilidade de reverter o hash');
  print('• Mudança mínima nos dados altera completamente o hash');
  print('• Proof-of-work real com dificuldade ajustável');
}
