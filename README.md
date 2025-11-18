# 🛒 Flutter Store - Avaliação

Este projeto simula uma aplicação de e-commerce (loja de produtos) desenvolvida em Flutter para fins de avaliação acadêmica. O foco principal é a implementação correta de componentes de interface (Front-end), navegação e gerenciamento de estado local simples (`setState`) para funcionalidades de favoritos.

## 🚀 Como Executar o Projeto

Siga os passos abaixo para rodar o projeto em seu ambiente de desenvolvimento:

### Pré-requisitos

* **Flutter SDK** (Versão 3.x ou superior)
* **Um Emulador** (Android ou iOS) ou um dispositivo físico conectado.

### Instalação

1.  **Clone o Repositório:**
    ```bash
    git clone [INSERIR A URL DO SEU REPOSITÓRIO AQUI]
    cd flutter_avaliacao
    ```

2.  **Instale as Dependências:**
    O Flutter buscará todas as dependências listadas no arquivo `pubspec.yaml`.
    ```bash
    flutter pub get
    ```

3.  **Execute a Aplicação:**
    ```bash
    flutter run
    ```
    *(Observação: A tela inicial é a de Login.)*

***

## ✨ Telas Implementadas (Funcionalidades Exigidas)

O aplicativo "Flutter Store" possui uma navegação completa entre as seguintes telas, acessíveis via rotas nomeadas (`/login`, `/register`, `/home`) ou pelo menu lateral (`Drawer`).

### 1. 🔑 Autenticação

| Tela | Funcionalidade | Conceitos Aplicados |
| :--- | :--- | :--- |
| **Login (`/login`)** | Permite acesso à Home. Possui validação básica de campos vazios e link para o cadastro. | `TextField`, `Form`, `GlobalKey<FormState>`, `Navigator.pushReplacementNamed`. |
| **Cadastro (`/register`)** | Coleta Nome, E-mail e Senha. Possui validação que garante que as senhas são idênticas. Retorna para o Login com mensagem de sucesso. | `TextFormField` com `validator`, `Navigator.pop`, `ScaffoldMessenger`. |

### 2. 🏠 Tela Principal (Home)

A `HomeScreen` atua como o **hub central do estado**, segurando a lista completa de produtos e o estado de favorito de cada um, garantindo a sincronia entre as demais telas.

* **Menu Lateral (`Drawer`):** Implementado com todas as opções de navegação (`Início`, `Produtos`, `Meus Produtos`, `Sobre`, `Sair`).
* **Gerenciamento de Estado:** A função `_toggleFavorite(productId)` reside na `HomeScreen` e usa `setState()` para atualizar toda a aplicação quando um produto é favoritado/desfavoritado.

### 3. 📦 Visualização de Produtos

| Tela | Funcionalidade | Conceitos Aplicados |
| :--- | :--- | :--- |
| **Lista de Produtos** | Exibe a lista completa de produtos simulados. Cada item possui o ícone de Favoritar que altera o estado do produto. | `ListView.builder`, `ListTile`, `IconButton`, passagem de função de callback (`onToggleFavorite`). |
| **Detalhes do Produto** | Exibe informações completas (imagem, descrição, preço). Permite favoritar/desfavoritar o item. | `SingleChildScrollView`, `Row` (para título e botão), `Image.asset`. |
| **Meus Produtos (Favoritos)** | Exibe **apenas** os produtos marcados como favoritos pelo usuário. Atualiza automaticamente quando o estado é modificado em qualquer outra tela. | Filtro de lista (`.where(p => p.isFavorite)`), `ListView.builder`. |
| **Sobre** | Tela estática com informações do app e do desenvolvedor. | Layout simples usando `Column`, `Row` e `Icon`. |

***

## ⚠️ Observações e Limitações

1.  **Persistência de Dados:** O estado de favoritos é **local e temporário**. Ele é mantido apenas na memória (`_allProducts` na `HomeScreen`) enquanto o aplicativo está rodando. Se o aplicativo for fechado ou reiniciado, a lista de favoritos voltará ao seu estado inicial (vazia).
2.  **Imagens:** O projeto utiliza imagens salvas na pasta `assets/images/` do projeto, conforme configurado no `pubspec.yaml`, seguindo boas práticas de assets locais.
3.  **Gerenciamento de Estado:** O projeto atende estritamente ao requisito de usar **`setState`** para o gerenciamento de estado dos favoritos. Não foram utilizadas bibliotecas de gerenciamento de estado mais complexas (como Provider, Riverpod ou BLoC) para simplificar a aplicação e focar nos fundamentos.
