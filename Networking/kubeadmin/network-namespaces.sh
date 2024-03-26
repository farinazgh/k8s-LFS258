sudo ip netns add red
sudo ip netns add blue
ip netns list
blue
red
ip link
#  1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
#  2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
#      link/ether 06:e5:f5:6f:51:5f brd ff:ff:ff:ff:ff:ff
#  3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
#      link/ether 02:42:07:f0:06:26 brd ff:ff:ff:ff:ff:ff

sudo ip netns exec red ip link
#  1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
sudo ip netns exec blue ip link
#  1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group default qlen 1000
#      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
arp
#  Address                  HWtype  HWaddress           Flags Mask            Iface
#  ip-172-31-16-1.eu-west-  ether   06:ac:b3:f0:b9:81   C                     eth0

sudo ip netns exec red arp
sudo ip netns exec blue arp
sudo -i
ip netns
blue
red
ip netns exec blue ip link
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00

ip netns exec blue arp
ip route
default via 172.31.16.1 dev eth0 proto dhcp src 172.31.19.162 metric 100
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
172.31.0.2 via 172.31.16.1 dev eth0 proto dhcp src 172.31.19.162 metric 100
172.31.16.0/20 dev eth0 proto kernel scope link src 172.31.19.162 metric 100
172.31.16.1 dev eth0 proto dhcp scope link src 172.31.19.162 metric 100

ip netns exec red ip route
ip netns exec blue ip route

ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 06:e5:f5:6f:51:5f brd ff:ff:ff:ff:ff:ff
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 02:42:07:f0:06:26 brd ff:ff:ff:ff:ff:ff


ip link add veth-red type veth peer name  veth-blue

ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 06:e5:f5:6f:51:5f brd ff:ff:ff:ff:ff:ff
3: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 02:42:07:f0:06:26 brd ff:ff:ff:ff:ff:ff
6: veth-blue@veth-red: <BROADCAST,MULTICAST,M-DOWN> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether 5e:03:d4:13:0b:2b brd ff:ff:ff:ff:ff:ff
7: veth-red@veth-blue: <BROADCAST,MULTICAST,M-DOWN> mtu 1500 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/ether ee:44:d3:09:9d:1f brd ff:ff:ff:ff:ff:ff

ip link set veth-red netns red
ip link set veth-blue netns blue

ip netns exec red ip addr add 192.168.15.1/24 dev veth-red
ip netns exec blue ip addr add 192.168.15.2/24 dev veth-blue

ip netns exec red ip link set dev veth-red up
ip netns exec blue ip link set dev veth-blue up

ip netns exec red ifconfig
veth-red: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.15.1  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::ec44:d3ff:fe09:9d1f  prefixlen 64  scopeid 0x20<link>
        ether ee:44:d3:09:9d:1f  txqueuelen 1000  (Ethernet)
        RX packets 9  bytes 726 (726.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9  bytes 726 (726.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ip netns exec blue ifconfig
veth-blue: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.15.2  netmask 255.255.255.0  broadcast 0.0.0.0
        inet6 fe80::5c03:d4ff:fe13:b2b  prefixlen 64  scopeid 0x20<link>
        ether 5e:03:d4:13:0b:2b  txqueuelen 1000  (Ethernet)
        RX packets 9  bytes 726 (726.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 9  bytes 726 (726.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ip netns red exec ping 192.168.15.2
Command "red" is unknown, try "ip netns help".
ip netns  exec red ping 192.168.15.2
PING 192.168.15.2 (192.168.15.2) 56(84) bytes of data.
64 bytes from 192.168.15.2: icmp_seq=1 ttl=64 time=0.050 ms
64 bytes from 192.168.15.2: icmp_seq=2 ttl=64 time=0.039 ms
^C
--- 192.168.15.2 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1012ms
rtt min/avg/max/mdev = 0.039/0.044/0.050/0.005 ms
ip netns  exec red routes
exec of "routes" failed: No such file or directory
ip netns  exec red ip route
192.168.15.0/24 dev veth-red proto kernel scope link src 192.168.15.1
ip netns  exec blue ip route
192.168.15.0/24 dev veth-blue proto kernel scope link src 192.168.15.2
ip netns  exec blue arp
Address                  HWtype  HWaddress           Flags Mask            Iface
192.168.15.1             ether   ee:44:d3:09:9d:1f   C                     veth-blue
ip netns  exec red arp
Address                  HWtype  HWaddress           Flags Mask            Iface
192.168.15.2             ether   5e:03:d4:13:0b:2b   C                     veth-red

