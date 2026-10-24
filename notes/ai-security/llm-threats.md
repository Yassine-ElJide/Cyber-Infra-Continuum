# LLM threats — starter outline (OWASP LLM Top 10)

A practical outline, not a full essay — filled in as I study.

## OWASP Top 10 for LLM Applications (categories to know)

1. **Prompt injection** — untrusted input overrides intended instructions
2. **Insecure output handling** — model output trusted and executed/rendered without validation
3. **Training data poisoning** — manipulated training data skews model behavior
4. **Model denial of service** — resource-exhaustion attacks against inference
5. **Supply chain vulnerabilities** — compromised base models, datasets, or plugins
6. **Sensitive information disclosure** — model leaks training data or context it shouldn't
7. **Insecure plugin design** — tool/plugin access without proper authz boundaries
8. **Excessive agency** — an agent granted more permissions/actions than the task needs
9. **Overreliance** — trusting model output without verification in critical paths
10. **Model theft** — exfiltration of model weights or proprietary fine-tunes

## Infra-minded practical checklist

- [ ] Treat all model input (including retrieved documents, tool outputs) as untrusted
- [ ] Sandbox and scope tool/plugin permissions per task, not globally
- [ ] Validate and sanitize model output before using it in code execution, SQL, or rendering
- [ ] Rate-limit and monitor inference endpoints like any other API
- [ ] Separate system prompts/secrets from user-visible context
- [ ] Log prompts and tool calls for audit, same as any privileged action

## Things to dig into further

- Retrieval-augmented generation (RAG) specific injection vectors
- Guardrail frameworks and where they fit in the request pipeline
