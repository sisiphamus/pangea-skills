```
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░                                                                          ░
░     ██████╗  █████╗ ███╗   ██╗ ██████╗ ███████╗ █████╗                   ░
░     ██╔══██╗██╔══██╗████╗  ██║██╔════╝ ██╔════╝██╔══██╗                  ░
░     ██████╔╝███████║██╔██╗ ██║██║  ███╗█████╗  ███████║                  ░
░     ██╔═══╝ ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██╔══██║                  ░
░     ██║     ██║  ██║██║ ╚████║╚██████╔╝███████╗██║  ██║                  ░
░     ╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝                  ░
░                                                                          ░
░              ███████╗██╗  ██╗██╗██╗     ██╗     ███████╗                 ░
░              ██╔════╝██║ ██╔╝██║██║     ██║     ██╔════╝                 ░
░              ███████╗█████╔╝ ██║██║     ██║     ███████╗                 ░
░              ╚════██║██╔═██╗ ██║██║     ██║     ╚════██║                 ░
░              ███████║██║  ██╗██║███████╗███████╗███████║                 ░
░              ╚══════╝╚═╝  ╚═╝╚═╝╚══════╝╚══════╝╚══════╝                 ░
░                                                                          ░
░         before the continents drifted, the craft was whole.              ░
░                                                                          ░
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

# Pangea Skills

**One pack. Many lands of craft. Shared with anyone who can run one command.**

Procedures that travel — not software, not SaaS, not another MCP to configure.  
Markdown skills that drop into Claude Code (and friends) and just *work*.

```
                    .              .  .  .
          .     *  .   *    .   .        *    .
       *     .        .   .     *    .     .
    .     ╔══════════════════════════════════╗   *
          ║   ≈≈≈≈≈  T H E   A T L A S  ≈≈≈≈ ║
   *      ║                                  ║      .
          ║     · writing coasts             ║
      .   ║     · code ridges                ║  *
          ║     · ui highlands    ← you are  ║
          ║     · research trenches          ║
    *     ║     · voice archipelagos         ║     .
          ║                                  ║
          ╚══════════════════════════════════╝
               \  drift is optional  /
                `--------------------'
```

---

## Install (the whole point)

**Claude Code — one shot:**

```bash
curl -fsSL https://raw.githubusercontent.com/sisiphamus/pangea-skills/main/install.sh | bash
```

That copies every skill into `~/.claude/skills/`.  
Open a **new** session and say:

> Use the **ui** skill.

**One land only:**

```bash
curl -fsSL https://raw.githubusercontent.com/sisiphamus/pangea-skills/main/install.sh | bash -s -- ui
```

**Clone classic:**

```bash
git clone https://github.com/sisiphamus/pangea-skills.git
cd pangea-skills
./install.sh
```

No Python. No MCP. No API keys. No path hell.

---

## The map

| Land | Path | What it is |
|------|------|------------|
| **ui** | [`skills/ui/`](./skills/ui/SKILL.md) | Visual craft layer — layout, color, type, components. Awwwards bar, anti-AI-slop bans, real references. Pure *look* (not deploy ops). |

```
                         N
                         │
              research   │   writing
                   \     │     /
                    \    │    /
              code ──●── PANGEA ── ui
                    /    │    \
                   /     │     \
              voice      │   gtm
                         │
                         S
```

More continents when we push them. The supercontinent grows by commit.

---

## Chat-only / Claude.ai

No install needed:

1. Open [`skills/ui/SKILL.md`](./skills/ui/SKILL.md)
2. Copy the whole file
3. Paste into chat: *“Follow this skill for the rest of the session.”*

---

## For humans in a hurry

→ **[FOR_PEOPLE.md](./FOR_PEOPLE.md)** — 30-second card  
→ **[catalog.md](./catalog.md)** — table of lands  
→ **[ATLAS.txt](./ATLAS.txt)** — full ASCII atlas (print it, frame it, ignore it)

---

## Contribute a land (maintainers)

```bash
./scripts/add-skill.sh /path/to/skill-folder
# strip private paths, set purpose: + share: public in frontmatter
./scripts/build-catalog.sh
git add skills catalog.md && git commit -m "land: <name>" && git push
```

Everyone who re-runs `install.sh` gets the new coast.

---

## License / spirit

Share freely. Steal the craft. Credit optional; quality not optional.

```
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ~  "the best skill is the one someone actually   ~
    ~   loads before they touch a pixel."            ~
     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                        \
                         \  ◆
```

---

**Pangea Skills** · [github.com/sisiphamus/pangea-skills](https://github.com/sisiphamus/pangea-skills)
