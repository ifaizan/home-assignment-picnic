# Picnic Home Assignment

[![Artifact HUB](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/elastic)](https://artifacthub.io/packages/search?repo=elastic)

This repository deploy a production-ready Elasticsearch 7.17.3 cluster composed of 2 different Helm
releases:

- `runner-es-master` for the 3 master nodes using [master values][]
- `runner-es-data` for the 3 data nodes using [data values][]

## Requirements

* Kubernetes >= 1.14
* Helm= 3.x

## Usage

* Deploy the 2 Elasticsearch releases: `make install`

* You can now setup a port forward to query Elasticsearch API:

  ```
  kubectl port-forward svc/runner-elasticsearch-master 9200
  curl http://localhost:9200
  ```

* To delete the helm charts, run `make delete`

## Notes

* The cluster installed by following the steps will create a 6 nodes cluster (3 dedicated master nodes pods and 3 data nodes pods). 
* The cluster ensures high availability since each of these pods are deployed on each of the available kubernetes node (which are distributed in different availability zones). 
* The reason of keeping 3 master nodes is to provide two backup nodes in the event of a master node failure and maintaining the necessary `quorum` (2) to elect a new master.
* The cluster also create Persistent Volumes (`10Gi` for master nodes and `30Gi` for data nodes) and Persistent Volume Claims as AWS `gp2` storage volumes
* All pods in a particular `nodeGroup` (either master nodes or data nodes) share the same ES role. 

[data values]: https://github.com/ifaizan/home-assignment-picnic/blob/develop/data.yaml
[master values]: https://github.com/ifaizan/home-assignment-picnic/blob/develop/master.yaml