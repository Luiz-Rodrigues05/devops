#bin/sh

cat <<EOT >> /home/vagrant/.ssh/authorized_keys
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC4Ywhqd6KyrVQTcuMkqtwMk19e/4baCWqYixi6PIgS8 vagrant@control-node
EOT