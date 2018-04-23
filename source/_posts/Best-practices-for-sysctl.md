---
title: Best practices for sysctl
date: 2017-06-29 15:10:35
tags: {sysctl,centos}
---
# Sysctl的最佳实践
## Linux Server的系统优化
显而易见，Linux已经成为绝大多数互联网企业首选的服务器操作系统。
发行版会默认一些固定的系统设定，但显然这些设定并不适合你的业务。
升级内核
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
rpm -Uvh http://www.elrepo.org/elrepo-release-6-6.el6.elrepo.noarch.rpm
yum --enablerepo=elrepo-kernel install kernel-lt -y
vim /etc/grub.conf       'default 1 更改为default 0'

### 第一要点：最大文件数（ulimit -a）
默认的"open files (-n) 1024 "是Linux操作系统对一个进程打开的文件句柄数量的限制(也包含打开的SOCKET数量，可影响如MySQL的并发连接数目)。
"The nproc limit on Linux counts the number of threads within all processes that can exist for a given user."
"ulimit -a"可以查看，修改则需要涉及到这几个文件1、'etc/security/limits.conf';2、'/etc/security/limits.d/90-nproc.conf'
cat /etc/security/limits.conf
* soft nofile 65535
* hard nofile 65535
cat /etc/security/limits.d/90-nproc.conf
*          soft    nproc     1024
root       soft    nproc     unlimite

### /etc/sysctl.conf
net.core.rmem_max=16777216 
net.core.wmem_max=16777216 
net.ipv4.tcp_rmem=4096 87380 16777216  
net.ipv4.tcp_wmem=4096 65536 16777216  
net.ipv4.tcp_fin_timeout = 30 
net.core.netdev_max_backlog = 30000 
net.ipv4.tcp_no_metrics_save=1 
net.core.somaxconn = 262144 
net.ipv4.tcp_syncookies = 1 
net.ipv4.tcp_max_orphans = 262144 
net.ipv4.tcp_max_syn_backlog = 262144 
net.ipv4.tcp_synack_retries = 2 
net.ipv4.tcp_syn_retries = 2
net.ipv4.ip_local_port_range = 1024 65535 
-----------------------------------------
fs.file-max = 1025500
net.core.netdev_max_backlog = 30000 
net.core.somaxconn = 10000 
net.core.rps_sock_flow_entries = 32768
net.ipv4.tcp_max_syn_backlog = 10000 
net.ipv4.tcp_max_tw_buckets = 10000 
net.ipv4.tcp_fin_timeout = 10 
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_synack_retries = 10 
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_keepalive_time = 180
net.ipv4.tcp_keepalive_intvl = 30
net.ipv4.tcp_keepalive_probes =5
net.ipv4.ip_local_port_range = 1024 65536 
