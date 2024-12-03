Alunos: Manoel Ribeiro e Natália Barbosa

# Complementando o projeto CompraEsperta

Após análise do problema, dos requisitos iniciais e do mini-mundo fornecidos,
sugerimos as seguintes modificações no projeto afim de melhorar o sistema e
atender melhor a necessidade dos clientes.

### Novas tabelas

- **Vendas** (_sales_): Uma tabela para registrar as vendas feitas para usuários finais nos canais de autoatendimento. 
- **Audits** (_audits_): Uma tabela para salvar as ações do sistema efetuadas por usuários.
- **Compras para o estoque** (_stock_purchases_): Tabela para registrar as ordens de compra com os fornecedores e atender o requisito RF4  
- **Abastecimentos de containers** (_container_supplies_): Tabela para registrar os abastecimentos que certo funcionário precisa executar em um container, informando qual container e também quais produtos precisam ser reabastecidos.
- **Clientes Finais** (_customers_): Tabela para guardar informações mínimas sobre os usuários que comprar no totem de auto atendimento

### Novas variáveis

De uma forma geral, para uma boa prática de banco de dados, vamos adicionar em todas as tabelas do banco, sejam elas
novas ou antigas, os seguintes atributos:

- **isCreated**: Para saber quando aquela entrada foi criada no banco afim de auditoria.
- **isUpdated**: Para saber quando aquela entrada foi alterada no banco, afim de auditoria.
- **isDeleted**: Para fazer soft delete no banco e garantir que dados não serão pertidos.
- **deletedAt**: Para saber quando um produto foi marcado como deletado no banco de dados, afim de auditoria.

Na tabela de produtos, vamos adicionar os seguintes

- **Localização no produto** (_pdrt_localisation_):
- **Vencimento de produto**

- **Vendedor Ativo ou não** (_is_active_):
- Localização no funcionário para que ele possa atuar nas lojas mais proximas

### Novos relacionamentos

- **Produtos e Compras de estoque** (_produtos_stock_purchases_): Esse relacionamento é necessário para registrar as compras de estoque com fornecedores para que o sistema possa ter um histórico de compras e atenda o RF4. Toda compra de estoque pode ter um ou mais produtos associados à ela.
- **Fornecedores e Compras de estoque** (_fornecedores_stock_purchases_): Esse relacionamento é necessário para registrar as compras de estoque com fornecedores para que o sistema possa ter um histórico de compras e atenda o RF4. Toda compra de estoque pode ter um ou mais fornecedores associados à ela.
- **Produtos e abastecimentos de containers** (_container_supplies_produtos_): Esse relacionamento é necessário para registrar quais produtos devem ser reabastecidos em determinado container quando o sistema disparar essa ação através da automação com IA. Um reabastecimento de estoque pode ter um ou vários produtos. 
- **Funcionário e abastecimentos de containers** (_funcionario_supplies_produtos_): Esse relacionamento é necessário para registrar qual funcionário deve reabastecer determinado container quando o sistema disparar essa ação através da automação com IA. Cara reabastecimento de estoque deve ser executado por 1 funcionário. 

### Novos requisitos

- **RF7**: Fazer auditoria dentro da sistema, para que seja possível localizar possíveis ações como
  deleção de lojas e etc
- **RF8**: Registrar as vendas para clientes finais, para gerar dados de vendas e possibilitar uma implementação futura de campanhas de desconto e promoção com base no comportamento dos usuários.
- **RF9**: O sistema deve indicar produtos que não foram vendido para clientes finais no último mês, assim será possível evitar o abastecimento de estoque desses produtos e evitar o investimento em produtos que não estão sendo vendidos.

# Criação dos modelos de banco de dados

Com uso da ferramenta [BrModelo](https://www.brmodeloweb.com/lang/pt-br/index.html), criamos o modelo conceitual do banco de dados. Já para criação do modelo lógico a ferramenta escolhida foi o [DbDiagram](https://dbdiagram.io/home).

### Conceitual

Colocar o link de uma imagem aqui

### Lógico

Colocar o link de uma imagem aqui

# push de teste
