#!/bin/sh
set -eu

API_BASE="${VANTAGE_TELEMETRY_URL:-http://localhost:50224}"
API_BASE="${API_BASE%/}"

mkdir -p /usr/share/nginx/html/static/js

cat > /usr/share/nginx/html/static/js/runtime-config.js <<EOF
window.VANTAGE_CONFIG = window.VANTAGE_CONFIG || {};
window.VANTAGE_CONFIG.apiBase = "${API_BASE}";
window.VANTAGE_CONFIG.mode = "${VANTAGE_UI_MODE:-standalone}";
window.VANTAGE_CONFIG.bridgeToken = null;
EOF

exec nginx -g "daemon off;"
