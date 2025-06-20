import 'dart:convert';
import 'package:crypto/crypto.dart';

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

  // Calcula o hash do bloco usando SHA-256 real
  String calculateHash() {
    final content = '$index$timestamp$data$previousHash$nonce';
    final bytes = utf8.encode(content);
    final digest = sha256.convert(bytes);
    return digest.toString();
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
