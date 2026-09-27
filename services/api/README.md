# API — Questões e exames

A API inicial fornece dados de demonstração em memória para validar o fluxo do app. Ainda não substitui PostgreSQL nem deve ser usada em produção sem persistência, autenticação e validação das fontes oficiais.

## Executar

```bash
cd services/api
npm install
npm run start:dev
```

## Endpoints

### Verificar serviço

```http
GET /health
```

### Listar questões

```http
GET /questions?category=ligeiro&topic=sinais
```

A resposta nunca expõe a alternativa correta.

### Obter uma questão

```http
GET /questions/q-001
```

### Criar simulado

```http
POST /exams
Content-Type: application/json

{
  "category": "ligeiro",
  "count": 10
}
```

O serviço seleciona perguntas aleatoriamente e devolve 30 minutos como duração inicial. O banco atual é pequeno e apenas de demonstração.

### Submeter resposta

```http
POST /exams/answers
Content-Type: application/json

{
  "questionId": "q-001",
  "optionId": "b"
}
```

Retorna se a resposta está correta e a explicação. A alternativa correta é retornada apenas neste endpoint após a submissão.

## Próximas etapas do backend

- PostgreSQL e migrações
- Histórico por utilizador para anti-repetição
- Resultado persistido do simulado
- Autenticação e autorização
- Conteúdo administrável
- Validação jurídica das perguntas, multas e fontes
