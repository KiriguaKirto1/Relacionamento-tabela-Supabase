# Relacionamento de Tabelas no Supabase

## Objetivo do projeto

O objetivo principal é mostrar como um banco de dados relacional pode organizar informações de forma estruturada, evitando repetição de dados e permitindo ligações entre diferentes tabelas.

Neste projeto, foram usados exemplos relacionados a:

- Copa do Mundo de 2026;
- sistema escolar com alunos, turmas, disciplinas, notas e matrículas;
- modelo mais completo de banco escolar para Supabase;
- exemplo de banco sobre inteligência artificial e infraestrutura;
- limpeza completa do schema `public` no Supabase.

## Estrutura dos arquivos

```txt
Relacionamento-tabela-Supabase-main/
├── DeleteAll.sql
├── SQL basic.sql
├── TabelaEscolaSimples.sql
├── TabelaEscolaCOMP.sql
├── TabelaIA.sql
├── LICENSE
└── README.md
```

## Descrição dos arquivos

### `SQL basic.sql`

Arquivo introdutório com uma tabela simples chamada `copa_2026`.

Ele demonstra conceitos básicos como:

- criação de tabela;
- chave primária;
- tipo `TEXT`;
- tipo `INT`;
- tipo `VARCHAR`;
- valor padrão com `DEFAULT`.

Exemplo de campos usados:

```sql
id_copa
pais
pontuacao
artilheiro
```

Esse arquivo é indicado para entender a base do comando `CREATE TABLE`.

---

### `TabelaEscolaSimples.sql`

Modelo escolar simplificado para Supabase.

Esse script cria tabelas para representar uma escola com alunos, turmas, disciplinas, matrículas e notas.

Principais tabelas:

```txt
escolas
turmas
alunos
disciplinas
matriculas
notas
```

Principais relacionamentos:

- uma escola pode ter várias turmas;
- uma turma pertence a uma escola;
- um aluno pode estar matriculado em uma turma;
- uma matrícula recebe notas em diferentes disciplinas;
- uma disciplina pode estar ligada a várias notas.

O script também possui:

- dados fictícios;
- constraints de validação;
- Row Level Security no Supabase;
- policies de leitura para usuários autenticados;
- views para consulta dos dados.

Views criadas:

```txt
vw_boletim_alunos
vw_media_alunos
vw_resumo_escolas
vw_resumo_turmas
vw_resumo_disciplinas
```

---

### `TabelaEscolaCOMP.sql`

Modelo escolar completo e mais avançado.

Esse arquivo representa uma versão mais robusta de um banco escolar, com maior organização e regras mais próximas de um sistema real.

Ele inclui tabelas como:

```txt
cidades
escolas
cursos
series_escolares
turnos
turmas
disciplinas
turma_disciplinas
trimestres
indicadores_avaliacao
estudantes
matriculas
registros_notas
observacoes_estudantis
```

Também possui recursos mais avançados, como:

- tipos `ENUM`;
- validações com `CHECK`;
- funções SQL;
- triggers;
- views de resumo;
- controle de permissões;
- políticas de segurança;
- estrutura para perfis de usuário;
- controle de observações e ocorrências estudantis.

Esse arquivo é indicado para demonstrar um banco de dados escolar mais completo, organizado e próximo de um sistema real.

---

### `TabelaIA.sql`

Modelo de banco de dados sobre inteligência artificial, empresas, modelos de IA, infraestrutura, uso de energia, água e custos.

Principais tabelas:

```txt
paises
idiomas
localidades
empresas
modelos_ia
implantacoes_ia
metricas_uso
infraestrutura
ambiental
custos
```

Esse script demonstra relacionamentos mais amplos, incluindo tabelas intermediárias para relações muitos-para-muitos.

Exemplos:

- um país pode ter vários idiomas;
- uma implantação de IA pode usar vários modelos;
- uma implantação pode envolver várias empresas;
- uma infraestrutura pode usar várias fontes de energia.

---

### `DeleteAll.sql`

Script de limpeza completa do schema `public`.

Ele remove:

- tabelas;
- views;
- materialized views;
- funções;
- tipos personalizados;
- enums.

> **Atenção:** esse arquivo apaga objetos do banco. Use apenas em ambiente de teste ou quando tiver certeza de que deseja limpar o schema `public`.

---

## Como executar no Supabase

1. Acesse o painel do Supabase.
2. Abra o projeto desejado.
3. Vá até **SQL Editor**.
4. Crie uma nova query.
5. Copie o conteúdo de um dos arquivos `.sql`.
6. Cole no editor.
7. Execute o script.

Para começar, recomenda-se executar primeiro:

```txt
TabelaEscolaSimples.sql
```

Esse arquivo é mais direto e mais fácil de entender para apresentação escolar.

## Ordem recomendada para estudo

```txt
1. SQL basic.sql
2. TabelaEscolaSimples.sql
3. TabelaEscolaCOMP.sql
4. TabelaIA.sql
5. DeleteAll.sql somente se precisar limpar o banco
```
