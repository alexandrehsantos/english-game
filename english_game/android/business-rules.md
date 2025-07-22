# Feature: Gamificação por **Chunks** + Variação de Respostas com **LLM Local CPU‑Only (≤ 2 GB RAM)**

> **Formato:** Documento técnico (Markdown) **Objetivo:** Definir a funcionalidade de gamificação baseada em *chunks* para treinar entrevistas em inglês **e** explicar como gerar variações de respostas usando **modelos locais rodando apenas em CPU**, sem placa de vídeo, com consumo de memória ≤ 2 GB.

---

## 1. Visão Geral

### 1.1 Problema

Profissionais não nativos travam em entrevistas em inglês por falta de vocabulário pronto, estruturas reutilizáveis e flexibilidade para reformular respostas de forma natural. Além disso, muitos usuários não têm GPU disponível, precisando de soluções **CPU‑only** e leves.

### 1.2 Solução

1. **Gamificação baseada em chunks**: frases frequentes em entrevistas, praticadas via puzzles, SRS e feedback.
2. **LLM Local (CPU‑only)**: gerar paráfrases curtas mantendo intenção e tom profissional, usando modelos quantizados leves que rodam em CPU com ≤ 2 GB RAM.

### 1.3 Resultados Esperados

- Maior fluência e rapidez na formulação de respostas.
- Diversidade lexical sem perder precisão semântica.
- Baixo custo operacional (inferência local, sem GPU, sem API cara).
- Alto engajamento via mecânica de jogo (XP, badges, ranking).
- Métricas claras de evolução (acerto, tempo de resposta, variedade de chunks usados).

---

## 2. Objetivos de Negócio e KPIs

| Objetivo             | KPI                               | Meta Inicial       |
| -------------------- | --------------------------------- | ------------------ |
| Engajamento diário   | DAU/MAU; tempo médio de sessão    | ≥ 20 min/dia       |
| Retenção de chunks   | Recall após 7 dias                | ≥ 70%              |
| Conversão p/ premium | Upgrade após 2 semanas            | ≥ 8%               |
| Qualidade pedagógica | Score em mock interviews          | +30%               |
| Redução de custos    | % requisições servidas localmente | ≥ 60% (plano free) |

---

## 3. Personas

- **Alex (35–45, Eng. Software):** entrevistas técnicas; quer eficiência, variação e roda tudo no laptop sem GPU.
- **Maria (24, Júnior):** ansiedade em entrevistas; precisa de frases prontas e prática guiada no celular/modesto notebook.
- **Carlos (40, Gerente):** vocabulário ok, mas pouca fluência formal; evita custos com serviços externos.

---

## 4. Conceitos-Chave

- **Chunk:** bloco/frase pronta (ex.: "One of my strongest skills is …").
- **Puzzle:** mini-jogo para fixar/praticar chunks (complete, jumble, escolha, tradução inversa, roleplay).
- **SRS (Spaced Repetition System):** algoritmos de repetição espaçada.
- **LLM Local CPU‑only:** modelo quantizado leve (GGUF) rodando via llama.cpp/ollama/GPT4All só com CPU.
- **Paráfrase Controlada:** geração com regras (tamanho, tom, sem inventar info).

---

## 5. Fluxo do Usuário

```mermaid
flowchart TD
  A[Onboarding] --> B[Escolha do Tema/Nível]
  B --> C[Lista de Chunks]
  C --> D[Puzzle 1: Complete o Chunk]
  D --> E[Puzzle 2: Jumble]
  E --> F[Puzzle 3: Escolha Correta]
  F --> G[Puzzle 4: Tradução Inversa]
  G --> H[Puzzle 5: Roleplay IA]
  H --> I[Feedback + XP + SRS]
  I --> J[Gerar Variações (LLM Local CPU)]
  J --> B
```

---

## 6. Tipos de Puzzles

### 6.1 Complete o Chunk

- Lacuna + múltipla escolha ou preenchimento livre (fuzzy).

### 6.2 Chunk Jumble (Frase Embaralhada)

- Drag & drop para ordenar palavras.

### 6.3 Escolha o Chunk Correto

- Pergunta típica → selecionar resposta natural/formal.

### 6.4 Tradução Inversa

- PT → EN (match fuzzy + destaque de erros).

### 6.5 Roleplay com IA

- Pergunta (voz/texto) → resposta do usuário → avaliação de chunk, gramática, pronúncia.

---

## 7. Gamificação

- **XP:** 10 (acerto), 5 (parcial), 0 (erro).
- **Streak:** bônus diário progressivo.
- **Badges:** *Chunk Master*, *Voice Confident*, *Fast Thinker*.
- **Ranking:** ligas (bronze/prata/ouro).

---

## 8. SRS (Repetição Espaçada)

### 8.1 Intervalos sugeridos

1d → 3d → 7d → 21d → 60d (ajustável pelo score).

### 8.2 Pseudocódigo

```python
BASE_INTERVALS = [1, 3, 7, 21, 60]

def next_interval(score, n):
    base = BASE_INTERVALS[min(n, len(BASE_INTERVALS)-1)]
    if score == 2:
        return base
    if score == 1:
        return max(1, int(base * 0.6))
    return 1
```

---

## 9. Estrutura de Dados

### 9.1 Chunk

```json
{
  "id": "chunk_042",
  "text": "One of my strongest skills is problem-solving.",
  "category": "strengths",
  "level": 3,
  "audio_url": "https://cdn.app/audio/chunk_042.mp3",
  "translation_pt": "Uma das minhas maiores habilidades é resolver problemas.",
  "usage_examples": [
    "One of my strongest skills is problem-solving, especially under pressure.",
    "I would say problem-solving is definitely one of my strongest skills."
  ],
  "tags": ["behavioral", "strengths"],
  "created_at": "2025-07-22T12:00:00Z"
}
```

### 9.2 Puzzle

```json
{
  "id": "puzzle_777",
  "chunk_id": "chunk_042",
  "type": "complete_chunk",
  "prompt": "I’m currently working as a ______.",
  "options": ["backend developer", "happy", "carpenter"],
  "correct_option_index": 0,
  "time_limit_sec": 20,
  "hints": ["Profissão"],
  "explanation": "Use a profissão/título profissional no espaço em branco.",
  "difficulty": 2
}
```

### 9.3 Progresso do Usuário

```json
{
  "user_id": "user_123",
  "chunk_id": "chunk_042",
  "last_score": 2,
  "reviews": 3,
  "next_review_at": "2025-07-25T08:00:00Z",
  "streak_days": 5
}
```

### 9.4 Sessão de Roleplay

```json
{
  "session_id": "rp_001",
  "user_id": "user_123",
  "question_id": "q_tell_me_about_yourself",
  "transcript_user": "I'm currently working as a senior software engineer at...",
  "chunks_detected": ["I’m currently working as…"],
  "grammar_score": 0.92,
  "pronunciation_score": 0.85,
  "latency_sec": 4.2,
  "overall_score": 0.89,
  "feedback": "Boa estrutura. Ajuste a pronúncia de 'currently'."
}
```

### 9.5 Variações (LLM Local CPU‑only)

```json
{
  "variation_id": "var_991",
  "base_answer_id": "ans_553",
  "model": "tinyllama-1.1b-chat-q4_0",
  "prompt_version": "v1.2",
  "inputs": {
    "base_text": "One of my strongest skills is problem-solving.",
    "constraints": {"max_tokens": 25, "tone": "formal"}
  },
  "outputs": [
    "Problem-solving is certainly among my top strengths.",
    "I consider problem-solving to be one of my key abilities.",
    "A key strength of mine is effective problem-solving."
  ],
  "created_at": "2025-07-22T12:10:00Z"
}
```

---

## 10. Arquitetura Técnica

### 10.1 Front-end (Flutter)

- Widgets: drag & drop, STT/TTS, players de áudio.
- Cache offline (chunks, variações).
- Chamada local ao LLM (desktop) ou microserviço LAN.

### 10.2 Back-end

- **Node.js/TS:** APIs REST/GraphQL (CRUD, progresso, SRS).
- **Python (opcional):** Whisper/STT, scoring de pronúncia, NLP.
- **Serviço LLM Local (CPU):** docker/binário (llama.cpp, ollama, GPT4All) para variações.

### 10.3 Banco de Dados

- PostgreSQL + Redis (cache).
- (Opcional) ChromaDB/Weaviate para busca semântica.

### 10.4 Infra

- Deploy em Vercel/Render/AWS.
- CDN para áudios/assets.
- Filas (SQS/RabbitMQ) para jobs assíncronos (voz, LLM, avaliação).

### 10.5 Módulo LLM Local CPU‑Only

#### 10.5.1 Pipeline de Geração

1. Sanitizar entrada (remover PII).
2. Prompt controlado (§12.4).
3. Gerar N variações (3–5).
4. Filtrar (regex de segurança, limite de tokens, repetição).
5. Persistir top‑K variações.
6. Fallback remoto se hardware insuficiente.

#### 10.5.2 Modelos ≤ 2 GB RAM (CPU)

> Estime \~1.3× o tamanho do GGUF em RAM (modelo + pequeno KV cache). Reduza `n_ctx`, `n_batch` e use quantização agressiva (Q4/Q3/Q2) quando necessário.

| Modelo (Instruct)         | Params | GGUF Q4 (\~) | RAM típica\* | Qualidade                      | Licença          |
| ------------------------- | ------ | ------------ | ------------ | ------------------------------ | ---------------- |
| **TinyLlama 1.1B Chat**   | 1.1B   | 0.7 GB       | \~1.0 GB     | Boa p/ respostas curtas        | Apache 2.0       |
| **Llama 3.2 1B Instruct** | 1.0B   | 0.6 GB       | \~0.9 GB     | Coerente/atual (2025)          | Meta Llama 3.2   |
| **Qwen2.5 1.5B Instruct** | 1.5B   | 1.0 GB       | \~1.4 GB     | Multilíngue, bom follow-up     | Apache 2.0       |
| **Gemma 2 2B IT**         | 2.0B   | 1.3 GB       | \~1.8 GB     | Fluente e concisa              | Gemma 2 (Google) |
| **Phi‑3.5 micro 1.6B**    | 1.6B   | 1.1 GB       | \~1.6 GB     | Excelente em instruções curtas | MIT              |
| **SmolLM 1.7B Instruct**  | 1.7B   | 1.1 GB       | \~1.6 GB     | Simples e direto               | Apache 2.0       |

\*RAM típica = modelo + KV cache de \~128 tokens. Sequências maiores exigem mais.

**Borderline (2–3 GB):**

| Modelo          | Params | GGUF Q3/Q4 | RAM \~     | Observação                            |
| --------------- | ------ | ---------- | ---------- | ------------------------------------- |
| Phi‑3 mini 3.8B | 3.8B   | 2.2–2.4 GB | 2.8–3.2 GB | Pode passar de 2 GB; use Q2/Q3 e swap |
| Llama 3 3B      | 3B     | 1.8–2.0 GB | 2.4–2.7 GB | Ajustar contexto/batch                |

#### 10.5.3 Dicas de Performance (CPU)

- **Quantização:** Q4\_K\_M é bom trade-off. Se faltar RAM, Q3\_K\_M ou Q2\_K.
- **Contexto (**``**):** 256–512 tokens bastam para paráfrases curtas.
- **Batch (**``**):** 16–32 para CPUs modestas.
- **Threads:** usar `--threads $(n_cores)` e `--parallel` quando suportado.
- **BLAS:** compile llama.cpp com OpenBLAS/BLIS para acelerar GEMM em CPU.
- **Swap:** habilitar swap para evitar OOM, mas evita lentidão.
- **Desabilitar GPU:** `--n-gpu-layers 0` (llama.cpp) garante CPU‑only.

#### 10.5.4 Exemplos de Execução

**Ollama (CPU‑only por padrão se não houver GPU):**

```bash
ollama pull tinyllama:1.1b-chat-q4_0
ollama run tinyllama:1.1b-chat-q4_0 "Parafraseie: 'One of my strongest skills is problem-solving.'"
```

**llama.cpp (CPU):**

```bash
./main \
 -m models/qwen2.5-1_5b-instruct-q4_0.gguf \
 -p "Gere 3 variações formais (≤25 palavras) para: 'One of my strongest skills is problem-solving.'" \
 --n-predict 120 --temp 0.7 --top-p 0.9 --threads 8 --n-gpu-layers 0 --ctx-size 384
```

**GPT4All (GUI/CLI CPU):**

```bash
gpt4all "Rewrite formally (≤25 words): 'One of my strongest skills is problem-solving.'"
```

---

## 11. APIs

### 11.1 REST

```http
GET /api/chunks?level=1&category=presentation
GET /api/puzzles?chunk_id=chunk_042
POST /api/progress
{
  "user_id": "user_123",
  "chunk_id": "chunk_042",
  "score": 2
}
```

#### 11.1.1 Endpoint de Variação Local

```http
POST /api/variation
{
  "base_text": "One of my strongest skills is problem-solving.",
  "tone": "formal",
  "max_tokens": 25,
  "n": 3
}
```

**Resposta:**

```json
{
  "variations": [
    "Problem-solving is certainly among my top strengths.",
    "I consider problem-solving to be one of my key abilities.",
    "A key strength of mine is effective problem-solving."
  ],
  "model": "tinyllama-1.1b-chat-q4_0"
}
```

### 11.2 GraphQL

```graphql
mutation GenerateVariation($input: VariationInput!) {
  generateVariation(input: $input) {
    variations
    model
    createdAt
  }
}
```

---

## 12. Feedback e Correção

### 12.1 Texto

- Gramática: LanguageTool/LLM local.
- Detecção de chunk: embeddings + cosine similarity.

### 12.2 Voz

- ASR: Whisper local (CPU) ou Google/Azure.
- Pronúncia: Speechace API ou heurísticas (IPA distance).

### 12.3 UX

- Destaque de erros; versão ideal; sugestão de revisão.

### 12.4 Prompt Template (Paráfrase – LLM Local CPU)

```text
Você é um assistente que gera variações curtas e formais de respostas de entrevista.
Regras:
- Preserve o sentido central.
- Tom profissional.
- ≤ 25 palavras.
- Não invente fatos.
- Gere 3 variações distintas.

Frase base: "{{base_text}}"
Saída JSON: {"variations": ["...", "...", "..."]}
```

---

## 13. Localização (i18n)

- UI: pt-BR, en-US, es-ES.
- Campos multilíngues em chunks, feedback e instruções.
- Templates parametrizados para mensagens.

---

## 14. Acessibilidade

- Leitores de tela, closed captions.
- Input apenas texto para PCD auditiva.
- Modo alto contraste.

---

## 15. Telemetria & Analytics

Eventos:

- `puzzle_started/completed` (score, tipo)
- `roleplay_completed` (tempo, score)
- `variation_generated` (modelo/local/remoto)
- `chunk_reviewed` (SRS)
- `badge_unlocked`, `streak_incremented`

Ferramentas: Segment / Amplitude / Mixpanel / Firebase.

---

## 16. Testes & QA

### 16.1 Critérios de Aceite

- Puzzle completo → XP + SRS atualizado.
- Roleplay com chunk alvo → chunk detectado.
- Variação local CPU → 3 outputs válidos (<25 palavras, sem erro grave).

### 16.2 Automação

- Unit: SRS, filtros de variação.
- Integração: API LLM local (timeout, memória).
- UI: Flutter widget tests.
- E2E: Cypress/Detox.

---

## 17. Roadmap

| Fase     | Funcionalidade              | Detalhes                    |
| -------- | --------------------------- | --------------------------- |
| MVP      | Puzzles + XP + SRS          | 50 chunks, 4 puzzles        |
| V1       | Roleplay + feedback (texto) | Detecção de chunk           |
| V1.1     | TTS/STT local (Whisper CPU) | Cache offline               |
| **V1.2** | **LLM local CPU ≤ 2 GB**    | TinyLlama/Qwen1.5B, filtros |
| V2       | Pronúncia scoring           | APIs de voz, ranking        |
| V3       | VR/AR + EEG (exp.)          | Wearables, neurofeedback    |

---

## 18. Segurança & Privacidade

- TLS + criptografia em repouso.
- Opt‑in para enviar dados a servidores.
- Sanitização de prompts (remover PII) antes de mandar p/ LLM.
- LGPD/GDPR: consentimento, direito ao esquecimento.

---

## 19. Licenciamento

- Chunks autorais/domínio público.
- TTS com licença comercial.
- Modelos: verificar licenças (Apache/MIT/Meta/Qwen/Gemma).

---

## 20. Anexos

### 20.1 Lista Inicial de Chunks (Nível 1)

```
1. I’m currently working as a _____.
2. In my previous role, I was responsible for _____.
3. One of my strongest skills is _____.
4. A challenge I faced was _____, and I overcame it by _____.
5. I’d describe my leadership style as _____.
6. I decided to apply because _____.
7. Thank you for the opportunity to discuss this position.
8. I’d love to know more about the team and the next steps.
9. I’m particularly proud of a project where _____.
10. I’m looking to grow in _____.
```

### 20.2 Prompt Template (Feedback LLM Texto)

```text
Avalie a resposta do usuário para a pergunta: "{{question}}".
Chunk alvo: "{{target_chunk}}"
Resposta do usuário: "{{user_answer}}"
Tarefas:
1. Indique se o chunk alvo foi usado (sim/não).
2. Corrija gramática e sugira uma versão melhor.
3. Aponte até 2 pontos de pronúncia (se houver áudio transcrito).
4. Dê uma nota geral (0 a 100).
```

### 20.3 Tabela Rápida – Modelos CPU ≤ 2 GB RAM

| Modelo              | Params | Arquivo (Q4) | RAM \~   | Qualidade p/ Parafrasear  | Obs                |
| ------------------- | ------ | ------------ | -------- | ------------------------- | ------------------ |
| TinyLlama 1.1B Chat | 1.1B   | \~0.7 GB     | \~1.0 GB | Boa para respostas curtas | CPU ultra leve     |
| Llama 3.2 1B        | 1.0B   | \~0.6 GB     | \~0.9 GB | Coerente e atual          | Prompt controlável |
| Qwen2.5 1.5B Inst   | 1.5B   | \~1.0 GB     | \~1.4 GB | Multilíngue               | Fácil quantização  |
| Gemma 2 2B IT       | 2.0B   | \~1.3 GB     | \~1.8 GB | Fluente e concisa         | Licença Google     |
| Phi‑3.5 micro 1.6B  | 1.6B   | \~1.1 GB     | \~1.6 GB | Ótimo em instruções       | MIT                |
| SmolLM 1.7B         | 1.7B   | \~1.1 GB     | \~1.6 GB | Simples/direto            | Comunidade ativa   |

---

**Fim do Documento**

