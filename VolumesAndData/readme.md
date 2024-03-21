##### StorageClasses

StorageClasses enables dynamic provisioning of storage resources.
##### Provisioners

provisioners are responsible for dynamically provisioning storage volumes
Without StorageClasses, administrators have to manually create PersistentVolumes (PVs) for each PersistentVolumeClaim
(PVC) made by users. With StorageClasses, this process is automated. 
When a user creates a PVC and specifies a StorageClasses, the system automatically creates a corresponding PV that meets the requirements.

so we have storage class as an automation wrapper to create PV(persistent Volume)

while StorageClasses alone don't handle the provisioning of storage volumes (which requires provisioners), they provide a layer of abstraction that streamlines the process of requesting and managing storage in Kubernetes. By leveraging StorageClasses, users can benefit from automated, on-demand provisioning of storage resources while abstracting away the complexities of the underlying storage infrastructure.

In addition to NFS provisioners, there are various other types of provisioners used in Kubernetes for dynamic provisioning of storage. Here are a few examples:

###### AWS Elastic Block Store (EBS) Provisioner:

An AWS EBS provisioner dynamically creates EBS volumes in AWS cloud environments to fulfill PersistentVolumeClaims (PVCs). It interacts with the AWS API to create, attach, and mount EBS volumes as needed by Kubernetes applications.

###### Google Compute Engine (GCE) Persistent Disk Provisioner:
Similar to AWS EBS provisioner, the GCE Persistent Disk provisioner dynamically creates and manages GCE persistent disks in Google Cloud Platform (GCP) environments.

###### Azure Disk Provisioner:
In Azure Kubernetes Service (AKS) or other Azure environments, the Azure Disk provisioner dynamically provisions Azure managed disks to fulfill storage requirements of Kubernetes applications.

###### Local Persistent Volume Provisioner:
The local persistent volume provisioner allows Kubernetes applications to use local storage resources on cluster nodes. It dynamically creates PersistentVolumes backed by local disks on the nodes, enabling applications to access and utilize local storage efficiently.

###### GlusterFS Provisioner:
GlusterFS provisioner dynamically provisions storage volumes using GlusterFS, a distributed file system. It creates and manages GlusterFS volumes to fulfill PVCs requested by applications running in the cluster.

###### Ceph RBD Provisioner:
Ceph RBD (Rados Block Device) provisioner dynamically provisions block storage volumes using Ceph, a distributed storage system. It creates and manages RBD volumes to fulfill PVCs requested by Kubernetes applications.