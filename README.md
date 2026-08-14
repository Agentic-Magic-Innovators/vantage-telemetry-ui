# Vantage Telemetry UI

Source for the telemetry dashboard static assets. **Production default:** files are copied into `vantage-telemetry-service/static` and served at **http://localhost:50224/dashboard**.

A separate nginx container (`:50226`) is optional — only for `docker compose --profile standalone-ui` in vantage-platform.

## Dev server

```powershell
cd static
python -m http.server 8080
# Point apiBase at http://localhost:50224 via ?apiBase= query or runtime-config.js
```

Bundled (recommended): http://localhost:50224/dashboard

## Docker (optional standalone nginx)

```powershell
copy .env.example .env
docker compose up -d --build
```

Full guide: [vantage-platform/DOCKER.md](../vantage-platform/DOCKER.md)

## Embedded mode

Harness UI loads `http://localhost:50224/dashboard?embed=1&bridge=<jwt>` and passes the bridge token as `Authorization: Bearer`.
