# TPC#3 - Testes de aceitação automatizados (Flutter)

**`!!Atenção!!`** Este README.md não é o relatório das atividades pedido na tarefa, serve apenas como uma contextualização geral acompanhada de alguns detalhes complementares.
O relatório solicitado como *deliverable* está **anexado à tarefa no moodle**, no entanto também pode ser encontrado [aqui](docs/Relatorio_TPC3.pdf).

Este repositório contém a implementação de testes de aceitação automatizados para a aplicação desenvolvida no âmbito do `TPC#1`. O objetivo deste trabalho é demonstrar a capacidade de verificar e validar requisitos de software através de ferramentas de automação em ambiente Flutter.

---

## Aplicação escolhida
A aplicação, denominada **"HelloNameApp"**, consiste numa interface minimalista de ecrã único, cuja funcionalidade principal é a exibição de uma saudação personalizada ("Hi! my name is Pedro") devidamente estilizada.

Devido à natureza estática da aplicação (ausência de fluxos de navegação complexos ou entradas de dados dinâmicas), a estratégia de teste focou-se na **Validação de especificações de design e estrutura**. Esta abordagem garante que a "promessa" visual feita ao utilizador é cumprida com rigor técnico, prevenindo regressões em futuras atualizações.

---

## Especificação do cenário de aceitação

**Funcionalidade:** Verificação da integridade visual e mensagem de boas-vindas.

**Cenário:** O utilizador lança a aplicação e valida a estrutura do ecrã principal.

* **Dado** que a aplicação é iniciada com sucesso num dispositivo ou emulador.
* **Quando** o utilizador visualiza o ecrã principal.
* **Então** o banner de "Debug" deve estar oculto.
* **E** a aplicação deve estar configurada com Material 3 desativado.
* **E** deve ser visível uma `AppBar` com o título "Hello" centralizado.
* **E** o tema da aplicação deve definir a cor primária como laranja.
* **E** deve ser exibida a mensagem `"Hi! my name is Pedro"` no centro do ecrã.
* **E** o texto da mensagem deve respeitar as especificações de estilo:
    * **Tamanho da fonte:** 28
    * **Espessura (Weight):** w500 (Medium)
    * **Alinhamento:** Center
* **E** a mensagem deve estar centrada no layout através de um widget `Center`

---

## Ferramentas e materiais
* **Framework:** Flutter SDK.
* **Ferramenta de Automação:** [integration_test](https://docs.flutter.dev/testing/integration-tests) (informação oficial do Flutter para testes End-to-End).
* **Ambiente de Execução:** Emulador Android / Android Studio.
* **Referência Técnica:** [Documentação de Testes do Flutter](https://docs.flutter.dev/testing).

Deixo aqui mais alguns links uteis, por mim utilizados, com vista à replicação desta tarefa por quem assim o desejar:

* [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
* [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
* [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

---

## Implementação

### 1. Planeamento e configuração
O processo iniciou-se com a análise dos requisitos da app e a escolha da ferramenta, tendo sido optado o `integration_test` por permitir o acesso direto à árvore de widgets em execução. A configuração foi realizada através da adição do pacote às `dev_dependencies` no `pubspec.yaml`.

* **Comando de configuração:** `flutter pub add dev:integration_test --sdk=flutter`

### 2. Desenvolvimento do código de teste
Os testes foram implementados na diretoria `integration_test/app_test.dart`, na implementação foram utilizados `Finders` avançados para inspecionar propriedades internas dos widgets (como `TextAlign` e `TextStyle`), garantindo uma validação que vai além da simples presença de texto no ecrã.

### 3. Execução e validação
A execução foi realizada num emulador Android, utilizando o comando oficial para testes de integração.

* **Comando para correr os testes:**

    - `flutter clean` (opcional, usar quando exitirem problemas na build)
    - `flutter pub get` (se o flutter clean for usado, deve ser usado este comando para repor as dependências)
    - `flutter test integration_test/app_test.dart`

---
