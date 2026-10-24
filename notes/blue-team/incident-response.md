# Incident response — starter notes

## The basic phases

1. **Preparation** — logging, backups, runbooks, contacts, in place *before* anything happens
2. **Identification** — confirm something is actually an incident, scope what's affected
3. **Containment** — isolate affected systems without destroying evidence
4. **Eradication** — remove the root cause (not just the symptom)
5. **Recovery** — restore from clean backups/images, verify integrity
6. **Lessons learned** — blameless postmortem, update runbooks and defaults

## Infra-minded takeaways

- **Backups are an infra decision.** If backups aren't tested restorable, recovery is a hope, not a plan.
- **Immutable infrastructure helps IR.** Rebuilding a compromised VM/container from a known-good image is faster and more certain than trying to "clean" a live host.
- **Segmentation limits blast radius.** The best incident response is one where containment is already half-done by network design.
- **Access logging pays off during IR**, not just during detection — knowing who touched what, when, shortens the identification phase a lot.

## Quick checklist when something looks off

- [ ] Is this confirmed, or still a hypothesis?
- [ ] What's the blast radius if I'm wrong about scope?
- [ ] Can I isolate without losing volatile evidence (memory, active connections)?
- [ ] Do I have a known-good backup/image to recover from?
- [ ] Who needs to be notified, and on what timeline?
