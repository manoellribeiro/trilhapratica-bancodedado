Alunos: Manoel Ribeiro e Natália Barbosa

# Complementando o projeto CompraEsperta

Após análise do problema, dos requisitos iniciais e do mini-mundo fornecidos,
sugerimos as seguintes modificações no projeto afim de melhorar o sistema e
atender melhor a necessidade dos clientes.

### Novas tabelas

- **Vendas** (_sales_): ...
- **Audits** (_audits_): Uma tabela para salvar as ações do sistema efetuadas por usuários.

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

...

### Novos requisitos

- Ter uma uma possibilidade de fazer auditoria dentro da sistema, para que seja possível localizar possíveis ações como
  deleção de lojas e etc

# Criação dos modelos de banco de dados

Com uso da ferramenta [BrModelo](https://www.brmodeloweb.com/lang/pt-br/index.html), criamos modelos conceitual e lógico do banco de dados.

### Conceitual

Colocar o link de uma imagem aqui

### Lógico

Colocar o link de uma imagem aqui

# push de teste
