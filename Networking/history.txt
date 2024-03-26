    1  netns list
    2  ip netns
    3  ip netns exec blue ip link
    4  ip netns exec blue aro
    5  ip netns exec blue arp
    6  ip route
    7  ip netns exec red ip route
    8  ip netns exec blue ip ip route
    9  ip netns exec blue ip route
   10  ip link add veth-red type veth peer name veth blue
   11  ip link add veth-red type veth peer name  blue
   12  ip link set veth-red netns red
   13  ip link set veth-blue netns blue
   14  ip  link help
   15  ip link show
   16  ip link delete blue
   17  ip link show
   18  ip link add veth-red type veth peer name  veth-blue
   19  ip link show
   20  ip link set veth-red netns red
   21  ip link set veth-blue netns blue
   22  ip -n red  addr add 192.168.15.1 dev veth-red 192.168.15.1
   23  ip netns exec red ifconfig
   24  ip -n red  addr add 192.168.15.1 dev vetip -n red  addr add 192.168.15.1 dev veth-red 192.168.15.1
   25  ip -n blue addr add 192.168.15.2 dev veth-blue 192.168.15.2
   26  h-red 192.168.15.1
   27  ip netns exec red ip addr add 192.168.15.1/24 dev veth-red
   28  ip netns exec blue ip addr add 192.168.15.2/24 dev veth-blue
   29  ip link set veth-red up
   30  ip netns red exec set veth-red up
   31  ip netns exec red  set veth-red up
   32  ip netns exec red ip link set dev veth-red up
   33  ip netns exec blue ip link set dev veth-blue up
   34  ip netns exec red ifconfig
   35  ip netns exec blue ifconfig
   36  ip netns red exec ping 192.168.15.2
   37  ip netns  exec red ping 192.168.15.2
   38  ip netns  exec red routes
   39  ip netns  exec red ip route
   40  ip netns  exec blue ip route
   41  ip netns  exec blue arp
   42  ip netns  exec red arp
   43  clear
   44  ip link add v-net-0 type bridge
   45  ip link
   46  ip link set v-net-0 up
   47  ip link add veth-red type veth peer name veth-red-vr
   48  # Create veth pairs
   49  ip link add veth-red type veth peer name veth-red-vr
   50  ip link add veth-blue type veth peer name veth-blue-br
   51  # Move veth interfaces to respective namespaces
   52  ip link set veth-red netns red
   53  ip link set veth-blue netns blue
   54  # Set master for veth interfaces
   55  ip link set veth-red-vr master v-net-0
   56  ip link set veth-blue-br master v-net-0
   57  # Assign IP addresses to interfaces within namespaces
   58  ip -n red addr add 192.168.15.1/24 dev veth-red
   59  ip -n blue addr add 192.168.15.2/24 dev veth-blue
   60  # Bring up the interfaces within namespaces
   61  ip -n red link set dev veth-red up
   62  ip -n blue link set dev veth-blue up
   63  clear
   64  docker images
   65  docker ps -a
   66  docker pull nginx
   67  docker images
   68  docker ps -a
   69  docker run --network host nginx
   70  docker run --network host nginx &
   71  kill -9 1357
   72  docker network ls
   73  history

6  in netns
   47  ip netns
   48  ip netns --help
   49  ip netns help
   50  ip netns list
   51  ps aux
   52  ip netns list
   53  ip netns help
   54  ip netns 888
   55  ip netns 888 clear
   56  clear
   57  arp
   58  clear
   59  ip netns add red
   60  sudo ipnetns add red
   61  sudo ip netns add red
   62  sudo ip netns add blue
   63  ip netns list
   64  ip link
   65  ip netns exec red ip link
   66  sudo ip netns exec red ip link
   67  sudo ip netns exec blue ip link
   68  arp
   69  sudo arp
   70  ip netns exec red arp
   71  sudo ip netns exec red arp
   72  sudo ip netns exec blue arp
   73  sudo -i
   74  sudo su
   75  history
