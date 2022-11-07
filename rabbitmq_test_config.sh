apt install -y erlang rabbitmq-server

mkdir -p /rabbitmq/rabbit_data && mkdir -p /rabbitmq/rabbit_log && chown -R rabbitmq:rabbitmq /rabbitmq/* && chmod 755 /rabbitmq/*

cat > /etc/rabbitmq/rabbitmq-env.conf << EOF
RABBITMQ_MNESIA_BASE=/rabbitmq/rabbit_data
RABBITMQ_LOG_BASE=/rabbitmq/rabbit_log
EOF

systemctl enable rabbitmq-server.service
systemctl start rabbitmq-server.service
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user dtuygadm qweASD123!!!
rabbitmqctl set_user_tags dtuygadm administrator
rabbitmqctl add_user monitoring dtuyg123???
rabbitmqctl set_user_tags monitoring monitoring
rabbitmqctl add_user $1 $2
rabbitmqctl set_user_tags $1 administrator
rabbitmqctl set_permissions -p / $1 ".*" ".*" ".*"
rabbitmqctl set_permissions -p / dtuygadm ".*" ".*" ".*"