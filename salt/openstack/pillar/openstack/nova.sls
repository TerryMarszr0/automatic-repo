nova:
  MYSQL_SERVER: 172.16.6.214
  NOVA_DBNAME: nova
  NOVA_API_DBNAME: nova_api
  PLACEMENT_DBNAME: nova_cell0
  NOVA_USER: nova
  NOVA_PASS: edong
  NEUTRON_USER: neutron
  NEUTRON_PASS: edong
  DB_ALLOW: nova.*
  API_DB_ALLOW: nova_api.*
  PLACEMENT_ALLOW: nova_cell0.*
  HOST_ALLOW: 172.16.6.0/255.255.255.0 
  RABBITMQ_HOST: 172.16.6.214
  RABBITMQ_PORT: 5672
  RABBITMQ_USER: openstack
  RABBITMQ_PASS: edong
  AUTH_KEYSTONE_HOST: 172.16.6.214 
  AUTH_KEYSTONE_PORT: 35357
  AUTH_KEYSTONE_PROTOCOL: http
  AUTH_ADMIN_PASS: edong
  ADMIN_PASSWD: edong
  ADMIN_TOKEN: aa160a08kjsldf386d58
  CONTROL_IP: 172.16.6.214
  VNC_PROXY_URL: http://172.16.6.214:6080/vnc_auto.html
  GLANCE_HOST: 172.16.6.214
  PLACEMENT_USER: placement
  PLACEMENT_PASS: edong
  VM_TYPE: qemu