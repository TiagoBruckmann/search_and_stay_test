# search_and_stay

Projeto prático para a vaga de dev Flutter na Search and Stay

### :star: Compilação Bundle release da loja android

```sh
flutter build appbundle
```

### :star2: Compilação APK release com ofuscação de codigo

```sh
flutter build apk --split-per-abi
```

## :gear: Flutter Setup
```sh
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build
    flutter run
```

## :bulb: Caso algo não estiver funcionando adequadamente
```sh
    flutter clean
    rm -rf pubspec.lock
    flutter pub get
    flutter pub run flutter_native_splash:create
    flutter pub run build_runner build --delete-conflicting-outputs
    flutter run
```

### :star: Executar os testes de unidade

```sh
flutter test test/folder/file_name.dart
flutter test test/folder/
flutter test test/
```

##### Arquitetura
A arquitetura utiliza no projeto foi clean architecture, separada em 3 camadas cada uma com suas responsabilidades.

### Application / App
É a camada responsavel pela exibição das telas, componentes proprios, controle de rotas internas de uma tela a outra e configuração dos temas do app.

#### Atribuições
- Exibição das regras de negocio em forma de tela;
- Comunicação com a camada domain;

### Domain
É a camada responsavel por cuidar das regras de negocio da aplicação.
Também é onde fica os modelos da aplicação.

#### Atribuições
- Gerencia de estados globais, assim como injeção e inversão de dependencia.
- Controle de todas as regras de negócio da aplicação.
- Comunicação com a camada Data;

### Data
É a camada responsavel por efetuar as requisições via API, armazenamento interno e configurações de serviços externos ex: firebase.
Também é a camada que possui os modelos de dados e comunicações externas.

#### Atribuições
- Armazenamento interno;
- Comunicação com API;
- Serviços externos;
- SQLite;