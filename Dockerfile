FROM nginx:1.27-alpine

COPY static/index.html /usr/share/nginx/html/index.html
COPY static/css /usr/share/nginx/html/static/css
COPY static/js /usr/share/nginx/html/static/js
COPY static/partials /usr/share/nginx/html/static/partials
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh \
    && sed -i 's/\r$//' /entrypoint.sh

EXPOSE 80

ENV VANTAGE_TELEMETRY_URL=http://localhost:50224
ENV VANTAGE_UI_MODE=standalone

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
    CMD wget --spider -q http://localhost/ || exit 1

ENTRYPOINT ["/entrypoint.sh"]
