# Blockchain Simples em Dart com SHA-256 Real

Este é um projeto que implementa um blockchain simples em Dart, demonstrando os conceitos fundamentais de blockchain como mineração, validação de integridade e detecção de adulteração. **Agora usa SHA-256 real para hashing criptográfico**.

## Características

- ✅ **Blocos com hash SHA-256 real**: Cada bloco possui um hash único de 64 caracteres hexadecimais
- ✅ **Mineração com Proof-of-Work real**: Sistema de mineração que encontra hashes SHA-256 com zeros no início
- ✅ **Validação de integridade**: Verifica se a cadeia de blocos não foi adulterada
- ✅ **Sistema de transações**: Permite adicionar transações pendentes
- ✅ **Detecção de adulteração**: Identifica quando um bloco foi modificado
- ✅ **Hash criptográfico real**: Usa SHA-256 da biblioteca crypto

## Estrutura do Projeto

```
lib/
├── block.dart          # Classe que representa um bloco individual
├── blockchain.dart     # Classe principal que gerencia a cadeia de blocos
└── main.dart          # Arquivo principal com demonstração

pubspec.yaml           # Configuração do projeto Dart
README.md             # Este arquivo
```

## Como Executar

1. **Instale o Dart SDK** (se ainda não tiver):
   - Visite: https://dart.dev/get-dart

2. **Instale as dependências**:
   ```bash
   dart pub get
   ```

3. **Execute o projeto**:
   ```bash
   dart run lib/main.dart
   ```

## Exemplo de Uso

```dart
import 'blockchain.dart';

void main() {
  // Cria uma nova blockchain
  final blockchain = Blockchain(difficulty: 4);
  
  // Adiciona transações
  blockchain.addTransaction('Alice', 'Bob', 50.0);
  blockchain.addTransaction('Bob', 'Charlie', 25.0);
  
  // Minera um novo bloco
  blockchain.addBlock('Dados do bloco');
  
  // Verifica a integridade
  final isValid = blockchain.isChainValid();
  print('Cadeia válida: $isValid');
}
```

## Conceitos Implementados

### 1. Bloco (Block)
- **Index**: Posição do bloco na cadeia
- **Timestamp**: Momento de criação
- **Data**: Informações armazenadas no bloco
- **Previous Hash**: Hash SHA-256 do bloco anterior
- **Hash**: Hash SHA-256 do bloco atual (64 caracteres hex)
- **Nonce**: Número usado na mineração

### 2. Blockchain
- **Cadeia de Blocos**: Lista sequencial de blocos
- **Dificuldade**: Número de zeros necessários no início do hash SHA-256
- **Transações Pendentes**: Lista de transações aguardando processamento
- **Validação**: Verificação de integridade da cadeia

### 3. Mineração com SHA-256
- **Proof-of-Work**: Algoritmo que encontra um nonce válido
- **Dificuldade Ajustável**: Controla o tempo de mineração
- **Hash SHA-256**: Garante que o trabalho foi realizado com hash criptográfico real

## Demonstração

O arquivo `main.dart` inclui uma demonstração completa que:

1. Cria uma nova blockchain
2. Adiciona transações
3. Minera blocos usando SHA-256 real
4. Verifica a integridade
5. Demonstra detecção de adulteração

## Características de Segurança

### SHA-256 Real
- **Hash de 64 caracteres**: Cada hash tem exatamente 64 caracteres hexadecimais
- **Irreversível**: Impossível reverter o hash para obter os dados originais
- **Avalanche effect**: Mudança mínima nos dados altera completamente o hash
- **Colisão resistente**: Extremamente difícil encontrar dois inputs com o mesmo hash

### Proof-of-Work Real
- **Dificuldade ajustável**: Controla quantos zeros são necessários no início
- **Trabalho computacional**: Requer processamento real para encontrar o nonce
- **Validação rápida**: Verificar se um hash é válido é muito rápido

## Aprendizado

Este projeto é ideal para:
- Entender os conceitos básicos de blockchain
- Aprender sobre criptografia SHA-256
- Compreender proof-of-work real
- Estudar validação de integridade
- Ver como hashes criptográficos protegem a cadeia

## Próximos Passos

Para expandir este projeto, você pode:
- Implementar carteiras digitais com chaves públicas/privadas
- Adicionar sistema de recompensas para mineradores
- Criar interface web para visualizar a blockchain
- Implementar rede P2P para sincronização
- Adicionar persistência de dados em banco
- Implementar smart contracts simples

## Dependências

- **crypto**: ^3.0.3 - Para hash SHA-256 real
- **test**: ^1.24.0 - Para testes unitários

---

**Nota**: Este projeto agora usa SHA-256 real, tornando-o mais próximo de uma implementação real de blockchain. Para uso em produção, considere implementar medidas de segurança adicionais como validação de transações, controle de acesso e proteção contra ataques. 