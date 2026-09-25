# Paperclip setup

- Category: learning
- Status: Done
- Started: 2026-09-25

## Goal

Install and run [Paperclip](https://paperclip.ing), an open-source,
self-hosted control plane for running teams of AI agents (org chart,
per-agent budgets, tickets, heartbeats). Source:
https://github.com/paperclipai/paperclip (MIT).

## Tech stack

- Node.js 22 (tested on v22.22.2), npm 10
- `paperclipai` CLI from npm (server version 2026.824.1 at install time)
- Embedded PostgreSQL 18 (bundled, no separate DB install)

## How to run

On a normal laptop (non-root user), the official one-liner works:

```
npx paperclipai onboard --yes   # first time: config, DB, starts server
npx paperclipai run             # later starts
```

Then open http://127.0.0.1:3100 and create your organization.

As root (Docker / cloud container), use the helper script instead:

```
sudo ./start-paperclip.sh onboard   # first time
sudo ./start-paperclip.sh run       # later starts
```

## How to test

```
curl http://127.0.0.1:3100/api/health   # expect "status":"ok"
```

First-run screen: [docs/first-run.png](docs/first-run.png)

## Notes

Problems hit during install and fixes:

1. `spawn .../embedded-postgres/.../initdb EACCES` when run as root.
   Postgres will not run as root, so the library drops to another user,
   which cannot read `/root/.npm`. Fix: run Paperclip as a non-root user.
2. `SELF_SIGNED_CERT_IN_CHAIN` from npm as the new user. The environment
   uses a TLS-intercepting proxy, and the new user did not inherit the
   proxy/CA env vars. Fix: pass `HTTPS_PROXY` and point
   `NODE_EXTRA_CA_CERTS` / `npm_config_cafile` at a readable copy of the CA.

Where things live (per user): `~/.paperclip/instances/default/`
(`config.json`, `db/`, `logs/`, `data/backups/`, `secrets/master.key`).
Never commit that folder - it holds the secrets master key.

No LLM provider or agents are configured yet. Next step: create an
organization in the UI and connect an agent (e.g. Claude Code).
