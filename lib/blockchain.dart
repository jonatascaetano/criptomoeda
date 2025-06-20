import 'block.dart';
import 'dart:convert';

class Blockchain {
  List<Block> chain;
  int difficulty;
  List<Map<String, dynamic>> pendingTransactions;

  Blockchain({this.difficulty = 4}) : chain = [], pendingTransactions = [] {
    // Cria o bloco genesis
    createGenesisBlock();
  }

  // Cria o primeiro bloco (bloco genesis)
  void createGenesisBlock() {
    final genesisBlock = Block(
      index: 0,
      timestamp: DateTime.now().toIso8601String(),
      data: 'Bloco Genesis',
      previousHash: '0',
    );

    genesisBlock.hash = genesisBlock.calculateHash();
    chain.add(genesisBlock);
  }

  // Retorna o último bloco da cadeia
  Block getLatestBlock() {
    return chain.last;
  }

  // Adiciona uma nova transação pendente
  void addTransaction(String from, String to, double amount) {
    final transaction = {
      'from': from,
      'to': to,
      'amount': amount,
      'timestamp': DateTime.now().toIso8601String(),
    };

    pendingTransactions.add(transaction);
    print('Transação adicionada: $from enviou $amount para $to');
  }

  // Adiciona um novo bloco à cadeia
  void addBlock(String data) {
    final previousBlock = getLatestBlock();
    final newBlock = Block(
      index: previousBlock.index + 1,
      timestamp: DateTime.now().toIso8601String(),
      data: data,
      previousHash: previousBlock.hash,
    );

    // Minera o bloco
    newBlock.mineBlock(difficulty);

    // Adiciona o bloco à cadeia
    chain.add(newBlock);

    // Processa transações pendentes
    processPendingTransactions();
  }

  // Processa transações pendentes
  void processPendingTransactions() {
    if (pendingTransactions.isNotEmpty) {
      print(
        'Processando ${pendingTransactions.length} transações pendentes...',
      );
      pendingTransactions.clear();
    }
  }

  // Verifica se a cadeia é válida
  bool isChainValid() {
    for (int i = 1; i < chain.length; i++) {
      final currentBlock = chain[i];
      final previousBlock = chain[i - 1];

      // Verifica se o hash atual é válido
      if (currentBlock.hash != currentBlock.calculateHash()) {
        print('Hash inválido no bloco $i');
        return false;
      }

      // Verifica se o hash anterior está correto
      if (currentBlock.previousHash != previousBlock.hash) {
        print('Hash anterior inválido no bloco $i');
        return false;
      }
    }

    print('Cadeia de blocos é válida!');
    return true;
  }

  // Retorna o tamanho da cadeia
  int getChainLength() {
    return chain.length;
  }

  // Retorna a cadeia como JSON
  List<Map<String, dynamic>> toJson() {
    return chain.map((block) => block.toJson()).toList();
  }

  // Exibe informações da cadeia
  void displayChain() {
    print('\n=== BLOCKCHAIN ===');
    print('Tamanho da cadeia: ${chain.length}');
    print('Dificuldade: $difficulty');
    print('Transações pendentes: ${pendingTransactions.length}');
    print('Cadeia válida: ${isChainValid()}');

    print('\n=== BLOCOS ===');
    for (int i = 0; i < chain.length; i++) {
      final block = chain[i];
      print('Bloco #$i:');
      print('  Hash: ${block.hash}');
      print('  Hash Anterior: ${block.previousHash}');
      print('  Dados: ${block.data}');
      print('  Timestamp: ${block.timestamp}');
      print('  Nonce: ${block.nonce}');
      print('');
    }
  }
}
