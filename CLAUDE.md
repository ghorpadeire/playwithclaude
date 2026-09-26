# Instructions for Claude Code

This repo is a multi-task workspace. Folders are created only when a task
needs them - never create empty category folders in advance.

## Where a new task goes

Put each task in `<category>/<task-name>/` (kebab-case, descriptive, e.g.
`java/jwt-auth-api`, not `project1`). Create the category folder the first
time a task needs it.

| Category     | What goes here                                        |
|--------------|-------------------------------------------------------|
| `java/`      | Java and Spring Boot apps, APIs, DSA practice         |
| `security/`  | Labs, tools, CTF writeups, pentest reports            |
| `web/`       | HTML/CSS/JS, React, portfolio                         |
| `python/`    | Python scripts and projects                           |
| `scripts/`   | Small shared utility scripts                          |
| `career/`    | CV, cover letters, interview prep                     |
| `learning/`  | Notes and quick experiments                           |

Purpose wins over language: a Java-based security tool goes in `security/`.
Do not add a new category without asking.

## For every task

1. Create the task folder and a README.md in it using the template below.
2. Keep build files and dependencies (`pom.xml`, `package.json`,
   `requirements.txt`) inside the task folder, never at the repo root.
3. Add or update the task's row in the Task index in the root README.md.

## Rules

- Never commit secrets or `.env` files; commit `.env.example` instead.
- Security tooling targets lab / authorised environments only; name the
  target (DVWA, HackTheBox, local VM) in the task README.
- If the repo is public, no personal data in `career/` (phone, address,
  visa details).
- Plain ASCII in docs and commit messages.
- Commit message format: `<category>/<task-name>: <change>`.

## Task README template

```
# <Task name>

- Category: <java | security | web | python | scripts | career | learning>
- Status: <In progress | Done | Paused>
- Started: <YYYY-MM-DD>

## Goal
What it does and why, in 2-3 lines.

## Tech stack
Language / framework / versions.

## How to run
## How to test
## Notes
Decisions, problems hit, next steps.
```
