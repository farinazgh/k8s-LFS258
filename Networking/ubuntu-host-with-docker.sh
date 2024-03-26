#
ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 06:e5:f5:6f:51:5f brd ff:ff:ff:ff:ff:ff
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 02:42:8a:a8:cc:bb brd ff:ff:ff:ff:ff:ff
#
ip route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         ip-172-31-16-1. 0.0.0.0         UG    100    0        0 eth0
172.17.0.0      0.0.0.0         255.255.0.0     U     0      0        0 docker0
ip-172-31-0-2.e ip-172-31-16-1. 255.255.255.255 UGH   100    0        0 eth0
172.31.16.0     0.0.0.0         255.255.240.0   U     100    0        0 eth0
ip-172-31-16-1. 0.0.0.0         255.255.255.255 UH    100    0        0 eth0
#
cat /proc/sys/net/ipv4/ip_forward
1
#
cat /etc/resolv.conf

nameserver 127.0.0.53
options edns0 trust-ad
search eu-west-1.compute.internal
some info about /etc/hosts
#1. it dominates the /etc/resolve.conf
#2. nslookup and dig do not query it