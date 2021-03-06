INSTALL PLUGIN auth_socket SONAME 'auth_socket.so';

SELECT PLUGIN_NAME, PLUGIN_STATUS
FROM INFORMATION_SCHEMA.PLUGINS
WHERE PLUGIN_NAME LIKE '%socket%';

CREATE USER 'dbuser'@'localhost' IDENTIFIED WITH auth_socket;