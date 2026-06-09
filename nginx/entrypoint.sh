#!/bin/sh
set -e

echo "Starting Nginx with LB_TYPE=${LB_TYPE}"

envsubst '${LB_TYPE}' < /tmp/backend.conf.template > /etc/nginx/conf.d/default.conf

# نمایش فایل نهایی برای دیباگ (اختیاری)
echo "✅ Generated config:"
cat /etc/nginx/conf.d/default.conf

# اجرای Nginx
exec nginx -g 'daemon off;'
