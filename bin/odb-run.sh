#!/bin/sh

# IMG=oracle-xe-11g
sudo systemctl start docker.service && \
docker start oracle-xe-11g && \
exec docker exec -it oracle-xe-11g bash
# sqlplus system/oracle@//localhost:1521/XE
# sqlplus msabr/1234@//localhost:1521/XE











# docker system prune -a (prune all)

# running the oracle-xe-11g
# docker pull oracleinanutshell/oracle-xe-11g
# docker run -d --name oracle-xe-11g -p 1521:1521 -p 8080:8080 -e ORACLE_ALLOW_REMOTE=true oracleinanutshell/oracle-xe-11g
# sqlplus system/oracle@//localhost:1521/XE

# see logs
# docker logs -f oracle-xe
