# Conventions

## Where does a new task go?

1. Pick the category that matches the main language or purpose:
   - Java code -> `java/`
   - Security tool, lab, CTF, pentest report -> `security/`
     (a Java-based security tool still goes in `security/`: purpose wins)
   - Frontend / website -> `web/`
   - Python -> `python/`
   - CV, cover letter, interview prep -> `career/`
   - Notes, quick experiments -> `learning/`
2. Create `<category>/<task-name>/` with a kebab-case name that says what it
   is (`jwt-auth-spring-boot`, not `project1` or `test`).
3. Copy `templates/task/README.md` into it and fill it in.
4. Add a row to the task index in the root `README.md`.

## Inside a task folder

```
<task-name>/
  README.md        what it is, how to run it, status
  src/             source code
  tests/ or src/test/  tests (Maven/Gradle use src/test)
  docs/            screenshots, diagrams, reports (optional)
```

Keep build files (`pom.xml`, `package.json`, `requirements.txt`) inside the
task folder, never at the repo root.

## Git

- Branch per task where possible: `task/<task-name>`.
- Commit messages: `<category>/<task-name>: <what changed>`,
  e.g. `java/todo-api: add JWT login endpoint`.
- Build output (`target/`, `build/`, `node_modules/`, `__pycache__/`) is
  ignored - never commit it.

## Security and privacy

- No secrets, tokens, passwords, or private keys. Use `.env` files (ignored)
  and commit a `.env.example` with placeholder values instead.
- Security tools and exploits are for lab / authorised targets only. State the
  target environment (e.g. DVWA, HackTheBox, local VM) in the task README.
- `career/`: if this repo is public, strip phone number, address, visa
  details and other personal data before committing.

## Formatting

- Plain ASCII in docs: straight quotes, hyphens, no smart punctuation.
