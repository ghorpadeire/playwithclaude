# playwithclaude

A workspace for tasks built with Claude Code. Every task lives in its own
folder inside a category, with its own README.

## Layout

| Folder       | What goes here                                                  |
|--------------|-----------------------------------------------------------------|
| `java/`      | Java and Spring Boot apps, APIs, DSA practice, Maven/Gradle     |
| `security/`  | Cybersecurity labs, tools, scripts, CTF writeups, reports       |
| `web/`       | HTML/CSS/JS, React and other frontend work                       |
| `python/`    | Python scripts, automation, data work                           |
| `scripts/`   | Small shell/utility scripts shared across the repo              |
| `career/`    | CV, cover letters, interview prep, job search notes             |
| `learning/`  | Notes, experiments, tutorials, throwaway spikes                 |
| `docs/`      | Repo-level docs and conventions                                 |
| `templates/` | Starter files copied when creating a new task                   |

## Conventions

- One task = one folder: `<category>/<task-name>/` (kebab-case, e.g.
  `java/student-management-api`).
- Every task folder has a `README.md` (copy `templates/task/README.md`).
- Each task is self-contained: its own build file, dependencies, and tests.
- Add a row to the task index below when a task is created or finished.
- Never commit secrets, API keys, passwords, or `.env` files.

Full rules: [docs/CONVENTIONS.md](docs/CONVENTIONS.md)

## Task index

| Date       | Task | Category | Status | Summary |
|------------|------|----------|--------|---------|
| 2026-09-25 | Repo structure | - | Done | Initial folder layout and conventions |
