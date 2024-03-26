#### Docker and CNI/CNM

Docker does not implement CNI. 
Docker has its own set of standards known as CNM which stands for container network model which is another standard that aims at solving container networking challenges similar to CNI but with some differences.

Due to the differences, these plugins don't natively integrate with Docker, meaning you can't run a Docker container and specify the network plugin to use a CNI and specify one of these plugins.

**But that doesn't mean you can't use Docker with CNI at all.** 

You just have to work around it yourself. 

1. create a Docker container without any network configuration docker network non
2. manually invoke the bridge plugin yourself.

That is pretty much how Kubernetes does it. 
When Kubernetes creates Docker containers, it creates them on the non-network.
It then invokes the configured CNI plugins who take care of the rest of the configuration.

We talk about CNI in Kubernetes in the upcoming lectures.

[//]: # (Correct! That's because 2379 is the port of ETCD to which all control plane components connect to. 2380 is only for etcd peer-to-peer connectivity. When you have multiple controlplane nodes. In this case we don't.)

we know that we have one to n pots inside a single node and every single of this part should be able to connect to other parts inside that note also to pause in other nodes in the cluster kubernetes does not implement this way of networking and we have to implement it oUR
one end is assigned to the container one inside brdige

