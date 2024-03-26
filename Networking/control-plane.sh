#
 ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc mq state UP mode DEFAULT group default qlen 1000
    link/ether 0a:1d:aa:f2:ea:cf brd ff:ff:ff:ff:ff:ff
3: tunl0@NONE: <NOARP,UP,LOWER_UP> mtu 8981 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/ipip 0.0.0.0 brd 0.0.0.0
6: cali438ad4c245a@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-a6e7855e-8aa2-7e5e-ce19-2fecab911d09
7: calidb6be421341@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-6a81c27e-e364-ae2a-381f-0bc7282844b5
8: calid3631409a5c@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-36b7f82d-35ab-8565-7906-a3f4d8b5a814
9: cali197bdcf33f8@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-64a9e7d8-e378-455a-dcd9-7ea4819deaab
10: calif97f7c7391a@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-34143c5b-080e-0d73-c1ea-15a87675a13e
11: cali0990ae1c83a@if3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 8981 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether ee:ee:ee:ee:ee:ee brd ff:ff:ff:ff:ff:ff link-netns cni-67f9fdab-96f1-17eb-bc59-9c8cb4da72c8
#
 ip route
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
default         ip-172-31-32-1. 0.0.0.0         UG    100    0        0 eth0
ip-172-31-0-2.e ip-172-31-32-1. 255.255.255.255 UGH   100    0        0 eth0
172.31.32.0     0.0.0.0         255.255.240.0   U     100    0        0 eth0
ip-172-31-32-1. 0.0.0.0         255.255.255.255 UH    100    0        0 eth0
192.168.10.0    0.0.0.0         255.255.255.192 U     0      0        0 *
ip-192-168-10-7 0.0.0.0         255.255.255.255 UH    0      0        0 cali0990ae1c83a
ip-192-168-10-1 0.0.0.0         255.255.255.255 UH    0      0        0 calif97f7c7391a
ip-192-168-10-1 0.0.0.0         255.255.255.255 UH    0      0        0 cali197bdcf33f8
ip-192-168-10-5 0.0.0.0         255.255.255.255 UH    0      0        0 cali438ad4c245a
ip-192-168-10-5 0.0.0.0         255.255.255.255 UH    0      0        0 calid3631409a5c
ip-192-168-10-5 0.0.0.0         255.255.255.255 UH    0      0        0 calidb6be421341
 cat /proc/sys/net/ipv4/ip_
ip_autobind_reuse           ip_dynaddr                  ip_forward                  ip_forward_use_pmtu         ip_local_reserved_ports     ip_nonlocal_bind
ip_default_ttl              ip_early_demux              ip_forward_update_priority  ip_local_port_range         ip_no_pmtu_disc             ip_unprivileged_port_start
#
 cat /proc/sys/net/ipv4/ip_forward
1
