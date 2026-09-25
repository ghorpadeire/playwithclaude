# Instructions for Claude Code

This repo is a multi-task workspace. Follow docs/CONVENTIONS.md.

When starting a new task:
1. Put it in `<category>/<task-name>/` (kebab-case). Categories: java,
   security, web, python, scripts, career, learning. Do not create new
   top-level folders without asking.
2. Create its README.md from `templates/task/README.md`.
3. Keep all build files and dependencies inside the task folder.
4. Add or update the task's row in the Task index in the root README.md.

Rules:
- Never commit secrets or `.env` files; provide `.env.example` instead.
- Security tooling targets lab / authorised environments only.
- Use plain ASCII in docs and commit messages.
- Commit message format: `<category>/<task-name>: <change>`.
