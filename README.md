# Picnic Home Assignment

This repository deploy an Elasticsearch 7.17.3 cluster composed of 2 different Helm
releases:

- `runner-es-master` for the 3 master nodes using [master values][]
- `runner-es-data` for the 3 data nodes using [data values][]

## Usage

* Deploy the 2 Elasticsearch releases: `make install`

* You can now setup a port forward to query Elasticsearch API:

  ```
  kubectl port-forward svc/multi-master 9200
  curl http://localhost:9200
  ```

* To delete the helm charts, run `make delete`

[data values]: https://github.com/ifaizan/
[master values]: https://github.com/ifaizan/