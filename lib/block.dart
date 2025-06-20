import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

class Block {
  final int index;
  final String timestamp;
  String data;
  final String previousHash;
  String hash;
  int nonce;

  Block({
    required this.index,
    required this.timestamp,
    required this.data,
    required this.previousHash,
    this.nonce = 0,
  }) : hash = '';

  // Calcula o hash do bloco (implementação simplificada)
  String calculateHash() {
    final content = '$index$timestamp$data$previousHash$nonce';
    final bytes = utf8.encode(content);
    return _simpleHash(bytes);
  }

  // Hash simples para demonstração
  String _simpleHash(List<int> bytes) {
    int hash = 0;
    for (int byte in bytes) {
      hash = ((hash << 5) - hash + byte) & 0xFFFFFFFF;
    }
    // Gera um hash de 64 caracteres para simular SHA-256
    String hashStr = hash.toRadixString(16).padLeft(8, '0');
    // Repete o hash para ter 64 caracteres
    return (hashStr * 8).substring(0, 64);
  }

  // Minera o bloco (encontra um hash que começa com zeros)
  void mineBlock(int difficulty) {
    final target = '0' * difficulty;

    while (true) {
      hash = calculateHash();
      if (hash.substring(0, difficulty) == target) {
        break;
      }
      nonce++;
    }

    print('Bloco minerado: $hash');
  }

  // Converte o bloco para JSON
  Map<String, dynamic> toJson() {
    return {
      'index': index,
      'timestamp': timestamp,
      'data': data,
      'previousHash': previousHash,
      'hash': hash,
      'nonce': nonce,
    };
  }

  @override
  String toString() {
    return 'Block{index: $index, timestamp: $timestamp, data: $data, previousHash: $previousHash, hash: $hash, nonce: $nonce}';
  }
}
